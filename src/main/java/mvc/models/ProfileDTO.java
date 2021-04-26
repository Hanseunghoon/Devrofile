package mvc.models;

import java.io.Serializable;
import java.util.Date;
import org.apache.commons.codec.digest.DigestUtils;
import lombok.Data;

@Data
public class ProfileDTO implements Serializable {

	private static final long serialVersionUID = 1L;

	private long no;
	private String title;
	private String name;
	private String password;
	private String content;
	private Date regdate;
	private int readcount;

	public void setPassword(String password) {
		this.password = DigestUtils.sha512Hex(password);
	}
}