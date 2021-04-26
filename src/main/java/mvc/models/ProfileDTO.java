package mvc.models;

import java.io.Serializable;
import org.apache.commons.codec.digest.DigestUtils;
import lombok.Data;

@Data
public class ProfileDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private long profile_no;
	private String username;
	private String nickname;
	private String password;
	private String email;
	private long read_count;
	private String github;
	private long acmicpc_rank;
	private long acmicpc_solved;
	private long acmicpc_rate;
	private String tech_stacks;
	private String project_name;
	private String award_name;
	private String university_name;
	private String major;
	private String company_name;
	private String job;

	public void setPassword(String password) {
		this.password = DigestUtils.sha512Hex(password);
	}
}