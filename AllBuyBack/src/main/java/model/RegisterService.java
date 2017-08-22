package model;

import java.util.Arrays;
import com.allbuyback.login.model.*;

public class RegisterService {

	char[] characterArray = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };// A-Z
	int[] numberArray = { 10, 11, 12, 13, 14, 15, 16, 17, 34, 18, 19, 20, 21, 22, 35, 23, 24, 25, 26, 27, 28, 29, 32,
			30, 31, 33 };// A-Z對應的數字
	int[] stringToIntArray = new int[26];// 放輸入的字串

	public boolean isAccountValid(String account) {
		System.out.println(account);
		MemberVO bean = new MemberDAO().select(account);
		// System.out.println(bean.getM_account());
		if (bean != null && bean.getM_account() == account)
			return false;
		else
			return true;
	}

	public boolean checkPassword(String password) {
		if (password.matches("^([0-9a-zA-Z])+$") && password.length() >= 3 && password.length() <= 16)
			return true;
		else
			return false;
	}

	public boolean checkIdentity(String identityString) {
		int index = 0;
		String inputString = identityString;// 丟進來的身分證字串
		Character firstLetter = inputString.charAt(0);// 抓出字串第一個英文
		for (int i = 1; i <= inputString.length() - 1; i++) {
			stringToIntArray[i] = (int) (inputString.charAt(i)) - 48;// 把身分證字號放入stringToIntArray[]，inputString.charAt(i)裡面的是字元1->49所以減48int
																		// 1
		}
		System.out.println(stringToIntArray.length);

		index = Arrays.binarySearch(characterArray, firstLetter);// 輸入的第一個英文字母判斷她是在characterArray中的第幾個index
		int d0 = numberArray[index];// 對應到的數字抓出來放入d0
		int x2 = (d0) % 10;// d0的個位數
		int x1 = (int) Math.floor((d0) / 10);// d0的十位數

		int result = x1 + (9 * x2) + (8 * stringToIntArray[1]) + (7 * stringToIntArray[2]) + (6 * stringToIntArray[3])
				+ (5 * stringToIntArray[4]) + (4 * stringToIntArray[5]) + (3 * stringToIntArray[6])
				+ (2 * stringToIntArray[7]) + (1 * stringToIntArray[8]) + (stringToIntArray[9]);
		System.out.println("result = " + result);

		if (result % 10 == 0) {
			return true;
		} else {
			return false;
		}
	}

	public void saveMember(MemberVO bean) {
		MemberDAO dao = new MemberDAO();
		dao.insert(bean);
	}

}
