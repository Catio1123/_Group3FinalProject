package com.group2.springboot.shopreview.controller;

import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.group2.springboot.member.model.CustomerBean;
import com.group2.springboot.shopreview.model.ArticleList;
import com.group2.springboot.shopreview.model.ArticleQueryService;
import com.group2.springboot.utils.SystemUtils;

@Controller("ArticleCrudController")
@SessionAttributes("aricleController")
public class ArticleCrudController {

	@Autowired
	ServletContext context;
	
	@Autowired
	ArticleQueryService service;

	@Autowired
	public ArticleList articleList;
	
	
	public ArticleCrudController() {
	}

	// read all orderList
	@GetMapping("/articleList")
	public @ResponseBody List<ArticleList> queryAllReviews(Model model) {
		List<ArticleList> articleList = service.selectAll();
		return articleList;
	}

	// show all
	@GetMapping({ "/article" })
	public String showAllOrderList() {
		return "shopreview/article";
	}

	// 查詢單筆AJAX
	@GetMapping(path = "/articleSelect.controller/{id}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArticleList read(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("id", id);

		return service.selectArticle(id);
	}

	// 新增 => (1)送出空白表單 (2)確認新增
	@GetMapping("/entryInsert")
	public String main(@ModelAttribute("articleList") ArticleList articleList) {
		return "shopreview/entryInsert";
	}
	
	@PostMapping("/entryInsert.co")
	public String processInsert(ArticleList articleList, RedirectAttributes ra) {
		Blob blob = null;
		String mimeType = "";
		String name = "";

		MultipartFile BlogImage = articleList.getBlogImage();

		try {
			InputStream is = BlogImage.getInputStream();
			name = BlogImage.getOriginalFilename();
			blob = SystemUtils.inputStreamToBlob(is);
			mimeType = context.getMimeType(name);
			articleList.setBlogPhoto(blob);
			articleList.setMimeType(mimeType);
		} catch (Exception e) {

			e.printStackTrace();
		}
		articleList.setBlogPhoto(blob);
		service.addArticle(articleList);
		String ext = SystemUtils.getExtFilename(name);

		try {
			File imageFolder = new File(SystemUtils.PLACE_IMAGE_FOLDER);
			if (!imageFolder.exists())
				// 這邊一定要加s -> mkdirs
				imageFolder.mkdirs();

			File file = new File(imageFolder, "CustomerImage_" + articleList.getId() + ext);
			BlogImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}

		ra.addFlashAttribute("successMessage", "新增成功");
		// 路徑要換 要寫的是mapping的路徑 不是jsp的路徑
		return "redirect:/article";
	}
	
	// 修改
	@GetMapping(path = "/articleNotRestUpdate/{id}")
	public String updateSearch(@PathVariable("id") Integer id, Model model) {
		ArticleList bean = service.selectArticle(id);
		// model.addAttribute("id", id);
		model.addAttribute("articleList", bean);

		return "shopreview/entryUpdate";
	}
	
	@PostMapping(path = "/articleNotRestUpdate/{id}")
	public String updateReal(@ModelAttribute("articleList") ArticleList articleList, RedirectAttributes ra) {

		Blob blob = null;
		String mimeType = "";
		String name = "";

		MultipartFile BlogImage = articleList.getBlogImage();
		if (BlogImage != null && BlogImage.getSize() > 0) {
		try {
			InputStream is = BlogImage.getInputStream();
			name = BlogImage.getOriginalFilename();
			blob = SystemUtils.inputStreamToBlob(is);
			mimeType = context.getMimeType(name);
			articleList.setBlogPhoto(blob);
			articleList.setMimeType(mimeType);
		} catch (Exception e) {

			e.printStackTrace();
		}
//		articleList.setBlogPhoto(blob);
		service.updateArticle(articleList);
		String ext = SystemUtils.getExtFilename(name);

		try {
			File imageFolder = new File(SystemUtils.PLACE_IMAGE_FOLDER);
			if (!imageFolder.exists())
				// 這邊一定要加s -> mkdirs
				imageFolder.mkdirs();

			File file = new File(imageFolder, "CustomerImage_" + articleList.getId() + ext);
			BlogImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
		}
		}
		ra.addFlashAttribute("successMessage", "新增成功");
		// 路徑要換 要寫的是mapping的路徑 不是jsp的路徑
		return "redirect:/article";
	}
	
	// 刪除 => (1)送出空白表單 (2)確認刪除
		@GetMapping(path = "/articleNotRestDelete/{id}")
		public String delete(@PathVariable("id") Integer id, Model model) {
			ArticleList bean = service.selectArticle(id);
//			model.addAttribute("id", id);
			model.addAttribute("articleList", bean);

			return "shopreview/entryDelete";
		}

		@PostMapping(path = "/articleList/{id}")
		public @ResponseBody Map<String, String> deleteEntry(@PathVariable(required = true, value = "id") Integer id) {
			Map<String, String> map = new HashMap<>();
			try {
				service.deleteArticle(id);
				map.put("msg", "刪除成功");
				map.put("success", "true");
//				{"msg":"刪除成功", "sucess":"true"}
			} catch (Exception e) {
				e.printStackTrace();
				map.put("msg", "刪除失敗");
				map.put("success", "false");
				System.out.println("刪除失敗");
			}
			return map;
		}

}
