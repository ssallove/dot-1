package kr.co.skplanet.aquamarine.model;

import java.util.LinkedHashMap;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.text.WordUtils;

/**
 * <p>DAO 에서 사용, 컬럼(SOME_COL_NAME)을 낙타표기법(someColumnName) 으로 변환하여 저장하기 위해 사용
 * @author 이도현
 * @since 2014. 4. 23.
 *
 */
public class CamelizedKeyMap extends LinkedHashMap<String, Object> {

	private static final long serialVersionUID = -3758017528394891791L;

	// private static final Pattern VALID_DB_COLUMN_PATTERN = Pattern.compile("^[A-Z0-9_]*[A-Z0-9]+[A-Z0-9_]*$", Pattern.CASE_INSENSITIVE);
	private boolean camelizeKey = true;

	/**
	 * <p>camelizeKey 속성이 true(기본값) 이면 key 를 낙타표기법(camelcase) 으로 변환하여 저장 
	 */
	@Override
	public Object put(String key,
					  final Object value) {

		// if(camelizeKey && VALID_DB_COLUMN_PATTERN.matcher(key).matches())
		if (camelizeKey)
			key = StringUtils.uncapitalize(WordUtils.capitalizeFully(key.toUpperCase()
																		.replaceAll("_", " "))
													.replaceAll(" ", ""));

		return super.put(key, value);

	}

	public boolean isCamelizeKey() {
		return camelizeKey;
	}

	public void setCamelizeKey(final boolean camelizeKey) {
		this.camelizeKey = camelizeKey;
	}

}
