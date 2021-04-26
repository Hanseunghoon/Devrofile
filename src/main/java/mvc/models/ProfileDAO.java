package mvc.models;

import java.sql.SQLException;
import java.util.List;

public interface ProfileDAO {

	void insertArticle(ProfileDTO articleDTO) throws SQLException;

	List<ProfileDTO> getArticleList() throws SQLException;

	void updateReadcount(long no) throws SQLException;

	ProfileDTO getDetail(long no) throws SQLException;

	int updateArticle(ProfileDTO articleDTO) throws SQLException;

	ProfileDTO getDelete(long no) throws SQLException;

	int deleteArticle(ProfileDTO articleDTO) throws SQLException;
}