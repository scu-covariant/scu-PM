using System;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
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
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
        private static void SetWallpaper(string strSavePath)
        {
            Bitmap myBmp = new Bitmap(strSavePath);
            string fileName = Path.GetTempFileName() + ".bmp";
            myBmp.Save(fileName, System.Drawing.Imaging.ImageFormat.Bmp);
            SystemParametersInfo(20, 1, fileName, 1);
        }
        public Form1()
        {
            InitializeComponent();
            backgroundWorker1.RunWorkerAsync();
        }
        private void backgroundWorker1_DoWork(object sender, System.ComponentModel.DoWorkEventArgs e)
        {
            while (true)
            {
                try
                {
                    string wallpaperPath = Path.GetTempFileName();
                    DownloadFile("http://mirrors.covariant.cn/wallpaper/latest", wallpaperPath);
                    SetWallpaper(wallpaperPath);
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
