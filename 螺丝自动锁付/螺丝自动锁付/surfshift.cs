
using OpenCvSharp;
using OpenCvSharp.Extensions;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace 螺丝自动锁付
{

    class surfshift
    {
        public static Bitmap  MatchPicBySurf(string file1path,string file2path, double threshold = 400)
        {
            Mat imgSrc = Cv2.ImRead(file1path) ;
            Mat imgSub = Cv2.ImRead(file2path) ;
            var outMat = new Mat();
            Mat matSrc = imgSrc;
            Mat matTo = imgSub;
            Mat matSrcRet = new Mat();
            Mat matToRet = new Mat();


            KeyPoint[] keyPointsSrc, keyPointsTo;
            using (var surf = OpenCvSharp.XFeatures2D.SURF.Create(threshold, 4, 3, true, true))
            {
                surf.DetectAndCompute(matSrc, null, out keyPointsSrc, matSrcRet);
                surf.DetectAndCompute(matTo, null, out keyPointsTo, matToRet);

            }    
            using (var flnMatcher = new OpenCvSharp.FlannBasedMatcher())
            {
                var matches = flnMatcher.Match(matSrcRet, matToRet);
                //求最小最大距离
                double minDistance = 1000;//反向逼近
                double maxDistance = 0;
                Parallel.For(0, matSrcRet.Rows, new ParallelOptions { MaxDegreeOfParallelism = 1 }, (i, state) =>
                {
                    double distance = matches[i].Distance;
                    if (distance > maxDistance)
                    {
                        maxDistance = distance;
                    }
                    if (distance < minDistance)
                    {
                        minDistance = distance;
                    }
                });

                Console.WriteLine($"max distance : {maxDistance}");
                Console.WriteLine($"min distance : {minDistance}");
                var pointsSrc = new List<Point2f>();
                var pointsDst = new List<Point2f>();
                //筛选较好的匹配点
                var goodMatches = new List<DMatch>();

                Parallel.For(0, matSrcRet.Rows, new ParallelOptions { MaxDegreeOfParallelism = 1 }, (i, state) =>
                {
                    double distance = matches[i].Distance;
                    if (distance < Math.Max(minDistance * 2, 0.02))
                    {
                        pointsSrc.Add(keyPointsSrc[matches[i].QueryIdx].Pt);
                        pointsDst.Add(keyPointsTo[matches[i].TrainIdx].Pt);
                        //距离小于范围的压入新的DMatch
                        goodMatches.Add(matches[i]);
                    }
                });


                // 算法RANSAC对匹配的结果做过滤

                var pSrc = pointsSrc.ToList();

                var pDst = pointsDst.ToList();
                var outMask = new Mat();
                // 如果原始的匹配结果为空, 则跳过过滤步骤
                if (pSrc.Count > 0 && pDst.Count > 0)
                {
                    InputArray data11 = InputArray.Create((List<Point2f>)pSrc);
                    InputArray data12 = InputArray.Create((List<Point2f>)pDst);

                    outMask = Cv2.GetPerspectiveTransform(pSrc, pDst);
                    // Cv2.FindHomography(data11, data12, HomographyMethods.None,3, outMask);
                }

                Point2f[] obj_corner = new Point2f[4];

                obj_corner[0] = new Point2f(0, 0);
                obj_corner[1] = new Point2f(matSrc.Cols, 0);
                obj_corner[2] = new Point2f(matSrc.Cols, matSrc.Rows);
                obj_corner[3] = new Point2f(0, matSrc.Rows);


                List<Point2f> scene_corner = new List<Point2f>();


                Cv2.PerspectiveTransform(InputArray.Create(obj_corner), OutputArray.Create(scene_corner), InputArray.Create(outMask));


                // 如果通过RANSAC处理后的匹配点大于10个,才应用过滤. 否则使用原始的匹配点结果(匹配点过少的时候通过RANSAC处理后,可能会得到0个匹配点的结果).
                if (outMask.Rows > 10)
                {
                    byte[] maskBytes = new byte[outMask.Rows * outMask.Cols];
                    outMask.GetArray(out maskBytes);
                    Cv2.DrawMatches(matSrc, keyPointsSrc, matTo, keyPointsTo, goodMatches, outMat, matchesMask: maskBytes, flags: DrawMatchesFlags.NotDrawSinglePoints);
                }
                else
                {
                    Cv2.DrawMatches(matSrc, keyPointsSrc, matTo, keyPointsTo, goodMatches, outMat, flags: DrawMatchesFlags.NotDrawSinglePoints);
                }

                // Cv2.Line(matTo, (int)scene_corner[0].X, (int)scene_corner[0].Y, (int)scene_corner[1].X, (int)scene_corner[1].Y, Scalar.Red, 2, LineTypes.Link8, 0);
                // Cv2.Line(matTo, (int)scene_corner[1].X, (int)scene_corner[1].Y, (int)scene_corner[2].X, (int)scene_corner[2].Y, Scalar.Red, 2, LineTypes.Link8, 0);
                // Cv2.Line(matTo, (int)scene_corner[2].X, (int)scene_corner[2].Y, (int)scene_corner[3].X, (int)scene_corner[3].Y, Scalar.Red, 2, LineTypes.Link8, 0);
                // Cv2.Line(matTo, (int)scene_corner[3].X, (int)scene_corner[3].Y, (int)scene_corner[0].X, (int)scene_corner[0].Y, Scalar.Red, 2, LineTypes.Link8, 0);

                flnMatcher.Dispose();
            }

            matSrcRet.Dispose();
            matToRet.Dispose();
            
            return outMat.ToBitmap();
        }

      

}
}
