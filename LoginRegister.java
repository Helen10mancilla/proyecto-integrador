import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LoginRegister {

    private static final String URL = "jdbc:mysql:http://localhost/phpmyadmin/index.php?route=/database/structure&db=la_gran_cosecha";
    private static final String USER = "root"; 
    private static final String PASSWORD = ""; 
    public static void main(String[] args) {
        String usuario = "usuarioEjemplo";
        String contrasena = "contrasenaEjemplo";

        registrarUsuario(usuario, contrasena);
    }

    public static void registrarUsuario(String usuario, String contrasena) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            String sql = "INSERT INTO usuarios (usuario, contrasena) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, usuario);
            pstmt.setString(2, contrasena);

           
            int filasInsertadas = pstmt.executeUpdate();

            if (filasInsertadas > 0) {
                System.out.println("¡Registro exitoso!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
           
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
