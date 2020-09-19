using Microsoft.Win32;
using System;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using System.Threading;
using System.Windows.Forms;

namespace Wallpaper_Assistant
{
    public partial class Form1 : Form
    {
        private static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }
        private static void DownloadFile(string URL, string filename)
        {
            File.Delete(filename);
            ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback(CheckValidationResult);
            HttpWebRequest Myrq = (HttpWebRequest)WebRequest.Create(URL);
            HttpWebResponse myrp = (HttpWebResponse)Myrq.GetResponse();
            Stream st = myrp.GetResponseStream();
            Stream so = new FileStream(filename, FileMode.Create);
            long totalDownloadedByte = 0;
            byte[] by = new byte[1024];
            int osize = st.Read(by, 0, by.Length);
            while (osize > 0)
            {
                totalDownloadedByte = osize + totalDownloadedByte;
                so.Write(by, 0, osize);
                osize = st.Read(by, 0, by.Length);
            }
            so.Close();
            st.Close();
        }
        const int SPI_SETDESKWALLPAPER = 20;
        const int SPIF_UPDATEINIFILE = 0x01;
        const int SPIF_SENDWININICHANGE = 0x02;

        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        private enum Style : int
        {
            Tiled,
            Centered,
            Stretched
        }

        private static void SetWallpaper(string strSavePath, Style style)
        {
            Bitmap myBmp = new Bitmap(strSavePath);
            string fileName = Path.GetTempFileName() + ".bmp";
            myBmp.Save(fileName, System.Drawing.Imaging.ImageFormat.Bmp);
            RegistryKey key = Registry.CurrentUser.OpenSubKey(@"Control Panel\Desktop", true);
            if (style == Style.Stretched)
            {
                key.SetValue(@"WallpaperStyle", 2.ToString());
                key.SetValue(@"TileWallpaper", 0.ToString());
            }
            if (style == Style.Centered)
            {
                key.SetValue(@"WallpaperStyle", 1.ToString());
                key.SetValue(@"TileWallpaper", 0.ToString());
            }
            if (style == Style.Tiled)
            {
                key.SetValue(@"WallpaperStyle", 1.ToString());
                key.SetValue(@"TileWallpaper", 1.ToString());
            }
            SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, fileName, SPIF_UPDATEINIFILE | SPIF_SENDWININICHANGE);
        }
        public Form1()
        {
            InitializeComponent();
            backgroundWorker1.RunWorkerAsync();
        }
        private void backgroundWorker1_DoWork(object sender, System.ComponentModel.DoWorkEventArgs e)
        {
            Thread.Sleep(5000);
            while (true)
            {
                try
                {
                    string wallpaperPath = Path.GetTempFileName();
                    DownloadFile("http://mirrors.covariant.cn/wallpaper/latest", wallpaperPath);
                    SetWallpaper(wallpaperPath, Style.Stretched);
                }
                catch (Exception)
                {
                    continue;
                }
                break;
            }
        }
        private void backgroundWorker1_RunWorkerCompleted(object sender, System.ComponentModel.RunWorkerCompletedEventArgs e)
        {
            Close();
        }
    }
}
