package dps.uminho.erp.components;

public class OperatorType {
	private int id;
	private String name;
	private String tag;
	private String description;
	
	public OperatorType( int id, String name, String tag) {
		this.id = id;
		this.name = name;
		this.tag = tag;
		this.description = "";
	}
	
	public OperatorType( int id, String name, String tag, String desc) {
		this.id = id;
		this.name = name;
		this.tag = tag;
		this.description = desc;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
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
		sb.append(tag).append("=>").append(name).append(" ").append(description);
		sb.append(']');
		return sb.toString();
	}
}
