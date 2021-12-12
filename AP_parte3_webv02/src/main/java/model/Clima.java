package model;

import model.weat;

public class Clima {
	
	String _id;
	float dist, lid, fid, lat, lon;
	String name, province;
	int zoom, updated;
	
	weat weather;

	public String get_id() {
		return _id;
	}

	public void set_id(String _id) {
		this._id = _id;
	}

	public float getDist() {
		return dist;
	}

	public void setDist(float dist) {
		this.dist = dist;
	}

	public float getLid() {
		return lid;
	}

	public void setLid(float lid) {
		this.lid = lid;
	}

	public float getFid() {
		return fid;
	}

	public void setFid(float fid) {
		this.fid = fid;
	}

	public float getLat() {
		return lat;
	}

	public void setLat(float lat) {
		this.lat = lat;
	}

	public float getLon() {
		return lon;
	}

	public void setLon(float lon) {
		this.lon = lon;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public int getZoom() {
		return zoom;
	}

	public void setZoom(int zoom) {
		this.zoom = zoom;
	}

	public int getUpdated() {
		return updated;
	}

	public void setUpdated(int updated) {
		this.updated = updated;
	}

	public weat getWeather() {
		return weather;
	}

	public void setWeather(weat weather) {
		this.weather = weather;
	}

	@Override
	public String toString() {
		return "Clima [_id=" + _id + ", name=" + name + ", province=" + province + "]";
	}


	
	
	

}
