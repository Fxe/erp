package dps.uminho.erp.components;

public class Localization {
	
	private int id;
	private String concelho;
	private String distrito;
	private String description;
	
	public Localization() {
		this.id = 0;
		this.concelho = "unknown";
		this.distrito = "unknown";
		this.description = "";
	}
	
	public Localization(int id, String concelho, String distrito) {
		this.id = 0;
		this.concelho = concelho;
		this.distrito = distrito;
		this.description = "";
	}
	
	public Localization(int id, String concelho, String distrito, String description) {
		this.id = 0;
		this.concelho = concelho;
		this.distrito = distrito;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public String getConcelho() {
		return concelho;
	}

	public void setConcelho(String concelho) {
		this.concelho = concelho;
	}

	public String getDistrito() {
		return distrito;
	}

	public void setDistrito(String distrito) {
		this.distrito = distrito;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append('[');
		sb.append(id).append(':');
		sb.append(concelho).append(", ").append(distrito).append(" ").append(description);
		sb.append(']');
		return sb.toString();
	}
}
