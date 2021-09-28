﻿using Ishp_VideoPluginServer.Common;
using System;
using System.Runtime.InteropServices;

namespace Ishp_PluginServer.Common.FaceApi
{
    class FaceManager
    {
        // 人脸注册(传入图片文件路径)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "user_add", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr user_add(string user_id, string group_id, string file_name,
            string user_info="");
        // 人脸注册(传入图片二进制buffer)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "user_add_by_buf", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr user_add_by_buf(string user_id, string group_id, byte[] image,
           int size, string user_info = "");

        // 人脸注册(传入特征值)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "user_add_by_feature", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr user_add_by_feature(string user_id, string group_id, byte[] fea,
           int fea_len, string user_info = "");

        // 人脸更新(传入图片文件路径)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "user_update", CharSet = CharSet.Ansi
            , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr user_update(string user_id, string group_id, string file_name,
            string user_info = "");
        // 人脸更新(传入图片二进制buffer)
        [DllImport("BaiduFaceApi.dll", EntryPoint = "user_update_by_buf", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr user_update_by_buf(string user_id, string group_id, byte[] image,
           int size, string user_info = "");
        // 人脸删除
        [DllImport("BaiduFaceApi.dll", EntryPoint = "user_face_delete", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr user_face_delete(string user_id, string group_id, string face_token);
        // 用户删除
        [DllImport("BaiduFaceApi.dll", EntryPoint = "user_delete", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr user_delete(string user_id, string group_id);
        // 组添加
        [DllImport("BaiduFaceApi.dll", EntryPoint = "group_add", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr group_add(string group_id);
        // 组删除
        [DllImport("BaiduFaceApi.dll", EntryPoint = "group_delete", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr group_delete(string group_id);
        // 查询用户信息
        [DllImport("BaiduFaceApi.dll", EntryPoint = "get_user_info", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr get_user_info(string user_id, string group_id);
        // 用户组列表查询
        [DllImport("BaiduFaceApi.dll", EntryPoint = "get_user_list", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr get_user_list(string group_id, int start = 0, int length = 100);
        // 组列表查询
        [DllImport("BaiduFaceApi.dll", EntryPoint = "get_group_list", CharSet = CharSet.Ansi
           , CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr get_group_list(int start = 0, int length = 100);
        // 测试人脸注册
        public string test_user_add(string user_id,string group_id,string file_name)
        {
            // 人脸注册
            //string file_name = "d:\\2.jpg";
            string user_info = "user_info";
            IntPtr ptr = user_add(user_id, group_id, file_name, user_info);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("user_add res is:" + buf);
            return buf;
        }
        // 测试人脸注册(传入二进制图片buffer)
        public void test_user_add_by_buf(byte[] img_bytes)
        {
            // 人脸注册
            string user_id = "500382199710067454";
            string group_id = "test_group";
            string user_info = "user_info";
            IntPtr ptr = user_add_by_buf(user_id, group_id, img_bytes, img_bytes.Length, user_info);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("user_add_by_buf res is:" + buf);
        }

        // 测试人脸注册(传入特征值)
        public void test_user_add_by_feature()
        {
            // 人脸注册
            string user_id = "test_user";
            string group_id = "test_group";
            // 传入人脸特征值，提取特征值demo，可参考FaceCompare文件中
            byte[] feature = new byte[2048];
            string user_info = "user_info";
            IntPtr ptr = user_add_by_feature(user_id, group_id, feature, feature.Length, user_info);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("user_add_by_feature res is:" + buf);
        }

        // 测试人脸更新
        public void test_user_update()
        {
            string user_id = "test_user";
            string group_id = "test_group";
            string file_name = "d:\\4.jpg";
            string user_info = "user_info";
            IntPtr ptr = user_update(user_id, group_id, file_name, user_info);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("user_update res is:" + buf);
        }
        // 测试人脸更新(传入二进制图片buffer)
        public void test_user_update_by_buf()
        {
            // 人脸更新
            string user_id = "test_user";
            string group_id = "test_group";
            System.Drawing.Image img = System.Drawing.Image.FromFile("d:\\8.jpg");
            byte[] img_bytes = ImageUtils.img2byte(img);
            string user_info = "user_info";
            IntPtr ptr = user_update_by_buf(user_id, group_id, img_bytes, img_bytes.Length, user_info);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("user_update_by_buf res is:" + buf);
        }

        // 测试人脸删除
        public void test_user_face_delete()
        {
            string user_id = "test_user";
            string group_id = "test_group";
            string face_token = "b6d8e657b5acd4dbae98efed64ea7c4b";
            IntPtr ptr = user_face_delete(user_id, group_id, face_token);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("user_face_delete res is:" + buf);
        }

        // 测试用户删除
        public void test_user_delete(string user_id,string group_id)
        {
            IntPtr ptr = user_delete(user_id, group_id);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("user_delete res is:" + buf);
        }

        // 组添加
        public void test_group_add()
        {
            string group_id = "test_group2";
            IntPtr ptr = group_add(group_id);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("group_add res is:" + buf);
        }

        // 组删除
        public void test_group_delete()
        {
            string group_id = "test_group2";
            IntPtr ptr = group_delete(group_id);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("group_delete res is:" + buf);
        }

        // 查询用户信息
        public void test_get_user_info()
        {
            string user_id = "test_user";
            string group_id = "test_group";
            IntPtr ptr = get_user_info(user_id , group_id);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("get_user_info res is:" + buf);
        }

        // 用户组列表查询
        public void test_get_user_list()
        {
            string group_id = "test_group";
            IntPtr ptr = get_user_list(group_id);
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("get_user_list res is:" + buf);
        }

        // 组列表查询
        public void test_get_group_list()
        {
            IntPtr ptr = get_group_list();
            string buf = Marshal.PtrToStringAnsi(ptr);
            Console.WriteLine("get_group_list res is:" + buf);
        }
    }
}
