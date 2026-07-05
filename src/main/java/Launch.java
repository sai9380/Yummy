import com.tap.model.User;
import com.tapdaoimple.UserDAOimple;

public class Launch {

    public static void main(String[] args) {

        UserDAOimple dao = new UserDAOimple();

        User user = new User(
                0,
                "saiprasad",
                "123456",
                "sai@gmail.com",
                "Pune",
                "8888888888",
                "Customer"
        );

        int res = dao.addUser(user);

        if(res > 0) {
            System.out.println("User inserted successfully");
        } else {
            System.out.println("Insertion failed");
        }
    }
}