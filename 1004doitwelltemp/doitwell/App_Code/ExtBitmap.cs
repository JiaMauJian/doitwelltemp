using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.IO;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;

namespace Base64Bitmaps
{
    public static class ExtBitmap
    {
        public static string ToBase64String(this Bitmap bmp, ImageFormat imageFormat)
        {
            string base64String = string.Empty;

            MemoryStream memoryStream = new MemoryStream();
            bmp.Save(memoryStream, imageFormat);

            memoryStream.Position = 0;
            byte[] byteBuffer = memoryStream.ToArray();

            memoryStream.Close();

            base64String = Convert.ToBase64String(byteBuffer);
            byteBuffer = null;

            return base64String;
        }

        public static string ToBase64ImageTag(this Bitmap bmp, ImageFormat imageFormat)
        {
            string imgTag = string.Empty;
            string base64String = string.Empty;

            base64String = bmp.ToBase64String(imageFormat);

            imgTag = "<img src=\"data:image/" + imageFormat.ToString() + ";base64,";
            imgTag += base64String + "\" ";
            imgTag += "width=\"" + bmp.Width.ToString() + "\" ";
            imgTag += "height=\"" + bmp.Height.ToString() + "\" />";

            return imgTag;
        }

        public static void Base64StringToBitmapSave(string base64String, string img_path, ref int height, ref int width)
        {
            var base64Data = Regex.Match(base64String, @"data:image/(?<type>.+?),(?<data>.+)").Groups["data"].Value;

            Bitmap bmpReturn = null;

            byte[] byteBuffer = Convert.FromBase64String(base64Data);
            MemoryStream memoryStream = new MemoryStream(byteBuffer);

            memoryStream.Position = 0;

            bmpReturn = (Bitmap)Bitmap.FromStream(memoryStream);

            height = bmpReturn.Height;
            width = bmpReturn.Width;            

            bmpReturn.Save(img_path, ImageFormat.Png);

            memoryStream.Close();
            memoryStream = null;
            byteBuffer = null;
            bmpReturn = null;
        }
    }
}
