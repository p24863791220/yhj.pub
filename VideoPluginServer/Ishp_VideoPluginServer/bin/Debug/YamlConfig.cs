using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using YamlDotNet.Serialization;

namespace XSPDFR.Common
{
    /// <summary>
    /// 序列化和反序列化yaml文件
    /// </summary>
    public class YamlConfig
    {
        static string _filePath = Directory.GetCurrentDirectory() + @"\Config\appconfig.yaml";

        static public void SetFilePath(string filePath)
        {
            _filePath = filePath;
        }

        /// <summary>
        /// 序列化操作  
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        static public void Serializer<T>(T obj)
        {
            StreamWriter yamlWriter = File.CreateText(_filePath);
            Serializer yamlSerializer = new Serializer();
            yamlSerializer.Serialize(yamlWriter, obj);
            yamlWriter.Close();
        }

        /// <summary>
        /// 泛型反序列化操作
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        static public T Deserializer<T>()  
        {
            if (!File.Exists(_filePath))
            {
                throw new FileNotFoundException();
            }
            StreamReader yamlReader = File.OpenText(_filePath);
            Deserializer yamlDeserializer = new Deserializer();

            //读取持久化对象  
            T info = yamlDeserializer.Deserialize<T>(yamlReader);
            yamlReader.Close();
            return info;
        }
    }
}
