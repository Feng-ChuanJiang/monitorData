package com.cci.core.generic.tree;

/**
 * Created by chuanJiang.Feng on 2015年7月30日 下午5:14:33 功能: 节点的信息
 */
public class Item {
	/**
	 * 节点的编号
	 */
	private String id;
	/**
	 * 节点的名字
	 */
	private String name;
	/**
	 * 备用的名字
	 */
	private String bakName;
	/**
	 * 节点的类型："item":文件 "folder":目录
	 */
	private String type;

	/**
	 * 子节点的信息
	 */
	private AdditionalParameters additionalParameters;



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBakName() {
		return bakName;
	}

	public void setBakName(String bakName) {
		this.bakName = bakName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public AdditionalParameters getAdditionalParameters() {
		return additionalParameters;
	}

	public void setAdditionalParameters(
			AdditionalParameters additionalParameters) {
		this.additionalParameters = additionalParameters;
	}

}
