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
        Image.GetThumbnailImageAbort OnResizeAbort = new Image.GetThumbnailImageAbort(ResizeAbort);
        Image new_image = original.GetThumbnailImage(scale_height, scale_height, OnResizeAbort, IntPtr.Zero);

        return new_image;
    }

    private static bool ResizeAbort()
    {
        return false;
    }
}
