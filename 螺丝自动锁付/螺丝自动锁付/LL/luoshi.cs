using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace 螺丝自动锁付.LL
{
    public enum  luoshineixing
    {
        拍照 = 0,
        吸螺丝 = 1,
        打螺丝 = 2,
        移动 = 3,        
    }
    class luoshicanshu
    {
        public string dianming;
        public luoshineixing neixing = 0;
        public double niuli;
        public double qiangtoujiaodu = 0;
        public int gongliaoqi = 1;
        public int xchafangweimin = -3;
        public int xchafangweimax = 3;
        public bool jingyong = false;
        public int vfretry = 3;
    }
    class luoshi
    {

    }
}
