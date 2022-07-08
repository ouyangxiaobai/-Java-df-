package util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.ServletInputStream;

/**
 * 上传文件时用到的类
 * 
 * @author Administrator
 *
 */
public class FileUpLoad {

	ServletInputStream in = null;
	String fpath = "";// 文件保存的路径默认为classPath
	private String fileur = null;

	public FileUpLoad() {
		fpath = "";
		in = null;
	}

	public void setInputStream(ServletInputStream in) {
		this.in = in;
	}

	public void setFpath(String p) {
		this.fpath = p;
	}

	public String getFpath() {
		return fpath;
	}

	public String getParameter() {
		String r = null;
		try {
			r = getParameter(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}

	public long getFileUpload() {
		long r = -1;
		try {
			r = getFileUpload(in, fpath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}

	public String getParameter(ServletInputStream in)
			throws Exception {
		int l = 0;
		byte[] b = new byte[1024];
		l = in.readLine(b, 0, b.length);
		String si = new String(b);
		if (si.startsWith("----------------------------")) {
			l = in.readLine(b, 0, b.length);
		}
		l = in.readLine(b, 0, b.length);
		l = in.readLine(b, 0, b.length);
		String value = new String(b, 0, l);
		return value;
	}

	public long getFileUpload(ServletInputStream in, String fpath)
			throws Exception {
		long begin = System.currentTimeMillis();
		int l = 0;
		byte[] b = new byte[1024];
		l = in.readLine(b, 0, b.length);
		String sign = new String(b, 0, l);
		l = in.readLine(b, 0, b.length);
		String info = new String(b, 0, l);
		l = in.readLine(b, 0, b.length);
		l = in.readLine(b, 0, b.length);
		int nIndex = info.toLowerCase().indexOf("filename=\"");
		int nLastIndex = info.toLowerCase().indexOf("\"", nIndex + 10);
		String filepath = info.substring(nIndex + 10, nLastIndex);
		int na = filepath.lastIndexOf("\\");
		String filename = filepath.substring(na + 1);
		String path = fpath + filename;
		File fi = new File(path);// 建立目标文件
		if (!fi.exists() && !fi.createNewFile())
			return -2;
		BufferedOutputStream f = new BufferedOutputStream(new FileOutputStream(fi));
		while ((l = in.readLine(b, 0, b.length)) > 0) {
			if (l == sign.length()) {
				String sign1 = new String(b, 0, sign.length());
				if (sign1.startsWith(sign))
					break;
			}
			f.write(b, 0, l);
			f.flush();
		}
		f.flush();
		f.close();
		fileur = path;
		long end = System.currentTimeMillis();
		return end - begin;
	}

	/**
	 * 
	 * @return 返回保存的文件的路径（包括文件名）
	 */
	public String getFileur() {
		return fileur;
	}
}
