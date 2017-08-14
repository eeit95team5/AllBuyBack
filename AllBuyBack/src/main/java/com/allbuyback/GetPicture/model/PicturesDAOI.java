package com.allbuyback.GetPicture.model;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.allbuyback.Wishing_Pool.model.Wishing_PoolVO;

public interface PicturesDAOI {
	public void readPictureForWishing_Pool(HttpServletResponse response, int pic_id, int w_id) throws IOException;
	public HttpServletRequest showUpLoadedPicture(HttpServletRequest request, int w_id);
	public Wishing_PoolVO rewritePictures(HttpServletRequest request, Wishing_PoolVO wp, int w_id) throws IOException, ServletException;
	public void readPictureForItem(HttpServletResponse response, int i_id) throws IOException;
}
