using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;

public class ImageResizer
{       
    public static Image Resize(Image original, int scale_width, int scale_height)
    {
        int width = 0;
        int height = 0;
        if (width > height)
        {
            width = scale_width;
            height = width * original.Height / original.Width;
        }
        else
        {
            height = scale_width;
            width = height * original.Width / original.Height;
        }

        Image.GetThumbnailImageAbort OnResizeAbort = new Image.GetThumbnailImageAbort(ResizeAbort);
        Image new_image = original.GetThumbnailImage(width, height, OnResizeAbort, IntPtr.Zero);

        return new_image;
    }

    private static bool ResizeAbort()
    {
        return false;
    }
}
