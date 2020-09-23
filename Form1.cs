using Microsoft.Win32;
using System;
using System.ComponentModel;
using System.Drawing;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Runtime.InteropServices;
using System.Security.Cryptography.X509Certificates;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Wallpaper_Assistant
{
    public partial class Form1 : Form
    {
        bool fatal = false;
        private static bool CheckValidationResult(object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }
        private static bool DownloadFile(string URL, string filename)
        {
            try
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
            catch (Exception)
            {
                return false;
            }
            return true;
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
            Thread.Sleep(3000);
            BackgroundWorker bgWorker = sender as BackgroundWorker;
            string configPath = "C:\\wallpaper_assistant_config.txt";
            StreamReader sr = null;
            try
            {
                sr = new StreamReader(configPath);
            }
            catch (Exception)
            {
                bgWorker.ReportProgress(-1);
                return;
            }
            int try_count = 10;
            // Timeout, millsec
            int time_out = 10000;
            // Interval, millsec
            int interval = 2000;
            int success = 0;
            while (true)
            {
                string url = sr.ReadLine();
                if (url == null)
                    break;
                if (Regex.Match(url, "^\\s*$").Success)
                    continue;
                success = 1;
                for (int c = 0; c < try_count; ++c)
                {
                    if (c > 0)
                        bgWorker.ReportProgress(c);
                    try
                    {
                        string wallpaperPath = Path.GetTempFileName();
                        var tokenSource = new CancellationTokenSource();
                        CancellationToken token = tokenSource.Token;
                        var task = Task.Factory.StartNew(() => DownloadFile(url, wallpaperPath), token);
                        if (!task.Wait(time_out, token) || !task.Result)
                        {
                            Thread.Sleep(interval);
                            continue;
                        }
                        SetWallpaper(wallpaperPath, Style.Stretched);
                    }
                    catch (Exception)
                    {
                        continue;
                    }
                    success = 2;
                    break;
                }
                if (success == 2)
                    break;
            }
            if (success == 0)
                bgWorker.ReportProgress(-1);
            else if (success == 1)
                bgWorker.ReportProgress(-2);
        }
        private void backgroundWorker1_RunWorkerCompleted(object sender, System.ComponentModel.RunWorkerCompletedEventArgs e)
        {
            if (!fatal)
                Close();
        }
        private void label3_Click(object sender, EventArgs e)
        {
            Environment.Exit(0);
        }
        private void backgroundWorker1_ProgressChanged(object sender, System.ComponentModel.ProgressChangedEventArgs e)
        {
            if (e.ProgressPercentage == -1)
            {
                fatal = true;
                Visible = false;
                MessageBox.Show("读取配置文件失败\n请检查 C:\\wallpaper_assistant_config.txt", "四川大学智慧教学系统壁纸同步工具", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Close();
            }
            else if (e.ProgressPercentage == -2)
            {
                fatal = true;
                Visible = false;
                MessageBox.Show("联络服务器失败", "四川大学智慧教学系统壁纸同步工具", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Close();
            }
            label3.Visible = true;
            label2.Text = "错误：无法连接至服务器。当前已尝试" + e.ProgressPercentage.ToString() + "次";
        }
    }
}