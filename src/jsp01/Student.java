package jsp01;

public class Student {

	int id;
	String studentNumber;
	String name;
	int departmentId;
	int year;
	
	public Student(int id, String studentNumber, String name, int departmentId, int year) {
		this.id = id;
		this.studentNumber = studentNumber;
		this.name = name;
		this.departmentId = departmentId;
		this.year = year;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getId() {
		return id;
	}

	public String getStudentNumber() {
		return studentNumber;
	}

	public String getName() {
		return name;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public int getYear() {
		return year;
	}
	
	
}
