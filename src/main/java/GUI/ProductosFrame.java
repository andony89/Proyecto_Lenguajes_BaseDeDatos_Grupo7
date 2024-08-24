/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package GUI;

/**
 *
 * @author andon
 */
import BD.ConexionOracle;
import java.sql.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import oracle.jdbc.OracleTypes;
import oracle.jdbc.OracleCallableStatement;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductosFrame extends javax.swing.JFrame {

    /**
     * Creates new form ProductosFrame
     */
    private DefaultTableModel modeloTabla;

    public ProductosFrame() {
        initComponents();
        // Configurar el comportamiento de cierre para que solo cierre esta ventana
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        modeloTabla = (DefaultTableModel) TableProductos.getModel();
        actualizarTabla();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        label1 = new java.awt.Label();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        TableProductos = new javax.swing.JTable();
        ProductoID = new javax.swing.JLabel();
        Nombre = new javax.swing.JLabel();
        CategoriaID = new javax.swing.JLabel();
        Precio = new javax.swing.JLabel();
        Stock = new javax.swing.JLabel();
        ProveedorID = new javax.swing.JLabel();
        txfProductoID = new javax.swing.JTextField();
        txfNombre = new javax.swing.JTextField();
        txfCategoriaID = new javax.swing.JTextField();
        txfPrecio = new javax.swing.JTextField();
        txfStock = new javax.swing.JTextField();
        txfProveedorID = new javax.swing.JTextField();
        btnAgregar = new javax.swing.JButton();
        btnBuscar = new javax.swing.JButton();
        btnEditar = new javax.swing.JButton();
        btnEliminar = new javax.swing.JButton();
        btnObtenerProductos = new javax.swing.JButton();

        label1.setText("label1");

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(204, 204, 255));

        TableProductos.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null},
                {null, null, null, null, null, null}
            },
            new String [] {
                "ProductoID", "Nombre", "CategoriaID", "Precio", "Stock", "ProveedorID"
            }
        ));
        jScrollPane1.setViewportView(TableProductos);

        ProductoID.setText("ProductoID");

        Nombre.setText("Nombre");

        CategoriaID.setText("CategoriaID");

        Precio.setText("Precio");

        Stock.setText("Stock");

        ProveedorID.setText("ProveedorID");

        btnAgregar.setText("Agregar");
        btnAgregar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAgregarActionPerformed(evt);
            }
        });

        btnBuscar.setText("Buscar");
        btnBuscar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarActionPerformed(evt);
            }
        });

        btnEditar.setText("Editar");
        btnEditar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditarActionPerformed(evt);
            }
        });

        btnEliminar.setText("Eliminar");
        btnEliminar.setToolTipText("");
        btnEliminar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEliminarActionPerformed(evt);
            }
        });

        btnObtenerProductos.setText("ObtenerProductos");
        btnObtenerProductos.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnObtenerProductosActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(ProductoID)
                                .addGap(18, 18, 18)
                                .addComponent(txfProductoID, javax.swing.GroupLayout.PREFERRED_SIZE, 46, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(Nombre)
                                .addGap(18, 18, 18)
                                .addComponent(txfNombre, javax.swing.GroupLayout.PREFERRED_SIZE, 252, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(CategoriaID)
                                .addGap(18, 18, 18)
                                .addComponent(txfCategoriaID, javax.swing.GroupLayout.PREFERRED_SIZE, 84, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(Precio)
                                .addGap(18, 18, 18)
                                .addComponent(txfPrecio, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(Stock)
                                .addGap(18, 18, 18)
                                .addComponent(txfStock, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(ProveedorID)
                                .addGap(18, 18, 18)
                                .addComponent(txfProveedorID, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(btnAgregar)
                                .addGap(18, 18, 18)
                                .addComponent(btnBuscar)
                                .addGap(18, 18, 18)
                                .addComponent(btnEditar)
                                .addGap(18, 18, 18)
                                .addComponent(btnEliminar)
                                .addGap(18, 18, 18)
                                .addComponent(btnObtenerProductos)))
                        .addGap(0, 127, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 352, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ProductoID)
                    .addComponent(txfProductoID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Nombre)
                    .addComponent(txfNombre, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(CategoriaID)
                    .addComponent(txfCategoriaID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Precio)
                    .addComponent(txfPrecio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Stock)
                    .addComponent(txfStock, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(ProveedorID)
                    .addComponent(txfProveedorID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnAgregar)
                    .addComponent(btnBuscar)
                    .addComponent(btnEditar)
                    .addComponent(btnEliminar)
                    .addComponent(btnObtenerProductos))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnAgregarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAgregarActionPerformed
        String nombre = txfNombre.getText();
        int categoriaID = Integer.parseInt(txfCategoriaID.getText());
        double precio = Double.parseDouble(txfPrecio.getText());
        int stock = Integer.parseInt(txfStock.getText());
        int proveedorID = Integer.parseInt(txfProveedorID.getText());

        try (Connection conn = ConexionOracle.getConnection()) {
            String sql = "{call crear_producto(?, ?, ?, ?, ?)}";
            try (CallableStatement stmt = conn.prepareCall(sql)) {
                stmt.setString(1, nombre);
                stmt.setInt(2, categoriaID);
                stmt.setDouble(3, precio);
                stmt.setInt(4, stock);
                stmt.setInt(5, proveedorID);
                stmt.executeUpdate();
                JOptionPane.showMessageDialog(this, "Producto agregado exitosamente.");
                actualizarTabla(); // Actualizar la tabla después de agregar
                limpiarCampos();   // Limpiar los campos de entrada
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al agregar el producto.");
        }
    }//GEN-LAST:event_btnAgregarActionPerformed

    private void btnBuscarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarActionPerformed
        int productoID = 0;
        try {
            productoID = Integer.parseInt(txfProductoID.getText());
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "ID de producto inválido. Asegúrese de ingresar un número válido.", "Error", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // Limpiar la tabla antes de mostrar los resultados
        DefaultTableModel modelo = (DefaultTableModel) TableProductos.getModel();
        modelo.setRowCount(0);

        try (Connection conn = ConexionOracle.getConnection()) {
            String sql = "{call leer_producto(?, ?)}";
            try (CallableStatement stmt = conn.prepareCall(sql)) {
                stmt.setInt(1, productoID);
                stmt.registerOutParameter(2, OracleTypes.CURSOR);
                stmt.execute();
                ResultSet rs = (ResultSet) stmt.getObject(2);

                if (rs.next()) {
                    // Agregar el producto encontrado a la tabla
                    Object[] row = new Object[]{
                        rs.getInt("ProductoID"),
                        rs.getString("Nombre"),
                        rs.getInt("CategoriaID"),
                        rs.getDouble("Precio"),
                        rs.getInt("Slock"),
                        rs.getInt("ProveedorID")
                    };
                    modelo.addRow(row);
                } else {
                    JOptionPane.showMessageDialog(this, "Producto no encontrado.");
                }

                rs.close(); // Cierra el ResultSet
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al buscar el producto. Detalles del error: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }//GEN-LAST:event_btnBuscarActionPerformed

    private void btnEliminarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEliminarActionPerformed
        int productoID = Integer.parseInt(txfProductoID.getText());

        try (Connection conn = ConexionOracle.getConnection()) {
            String sql = "{call eliminar_producto(?)}";
            try (CallableStatement stmt = conn.prepareCall(sql)) {
                stmt.setInt(1, productoID);
                stmt.executeUpdate();
                JOptionPane.showMessageDialog(this, "Producto eliminado exitosamente.");
                actualizarTabla(); // Actualizar la tabla después de eliminar
                limpiarCampos();   // Limpiar los campos de entrada
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al eliminar el producto.");
        }
    }//GEN-LAST:event_btnEliminarActionPerformed

    private void btnEditarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditarActionPerformed
        int productoID = Integer.parseInt(txfProductoID.getText());
        String nombre = txfNombre.getText();
        int categoriaID = Integer.parseInt(txfCategoriaID.getText());
        double precio = Double.parseDouble(txfPrecio.getText());
        int stock = Integer.parseInt(txfStock.getText());
        int proveedorID = Integer.parseInt(txfProveedorID.getText());

        try (Connection conn = ConexionOracle.getConnection()) {
            String sql = "{call actualizar_producto(?, ?, ?, ?, ?, ?)}";
            try (CallableStatement stmt = conn.prepareCall(sql)) {
                stmt.setInt(1, productoID);
                stmt.setString(2, nombre);
                stmt.setInt(3, categoriaID);
                stmt.setDouble(4, precio);
                stmt.setInt(5, stock);
                stmt.setInt(6, proveedorID);
                stmt.executeUpdate();
                JOptionPane.showMessageDialog(this, "Producto actualizado exitosamente.");
                actualizarTabla(); // Actualizar la tabla después de editar
                limpiarCampos();   // Limpiar los campos de entrada
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al actualizar el producto.");
        }
    }//GEN-LAST:event_btnEditarActionPerformed

    private void btnObtenerProductosActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnObtenerProductosActionPerformed
        try (Connection conn = ConexionOracle.getConnection()) {
            String sql = "{call ObtenerProductos(?)}";

            try (CallableStatement cstmt = conn.prepareCall(sql)) {
                cstmt.registerOutParameter(1, OracleTypes.CURSOR);

                cstmt.execute();

                try (ResultSet rs = (ResultSet) cstmt.getObject(1)) {
                    DefaultTableModel modeloTabla = (DefaultTableModel) TableProductos.getModel();
                    modeloTabla.setRowCount(0); // Limpiar la tabla

                    while (rs.next()) {
                        int productoID = rs.getInt("ProductoID");
                        String nombre = rs.getString("Nombre");
                        int categoriaID = rs.getInt("CategoriaID");
                        double precio = rs.getDouble("Precio");
                        int stock = rs.getInt("Slock");
                        int proveedorID = rs.getInt("ProveedorID");

                        // Agregar los datos a la tabla
                        modeloTabla.addRow(new Object[]{productoID, nombre, categoriaID, precio, stock, proveedorID});
                    }
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(this, "Error al cargar datos: " + e.getMessage());
        }
    }//GEN-LAST:event_btnObtenerProductosActionPerformed

    /**
     * @param args the command line arguments
     */
    private void limpiarCampos() {
        txfNombre.setText("");
        txfCategoriaID.setText("");
        txfPrecio.setText("");
        txfStock.setText("");
        txfProveedorID.setText("");
        txfProductoID.setText("");
    }

    private void actualizarTabla() {
        DefaultTableModel modelo = (DefaultTableModel) TableProductos.getModel();
        modelo.setRowCount(0); 

        try (Connection conn = ConexionOracle.getConnection()) {
            String sql = "{call ObtenerProductos(?)}";
            try (CallableStatement stmt = conn.prepareCall(sql)) {
                stmt.registerOutParameter(1, OracleTypes.CURSOR);
                stmt.execute();
                ResultSet rs = (ResultSet) stmt.getObject(1);

                while (rs.next()) {
                    Object[] row = new Object[]{
                        rs.getInt("ProductoID"),
                        rs.getString("Nombre"),
                        rs.getInt("CategoriaID"),
                        rs.getDouble("Precio"),
                        rs.getInt("Slock"),
                        rs.getInt("ProveedorID")
                    };
                    modelo.addRow(row);
                }

                rs.close(); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Error al actualizar la tabla. Detalles del error: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ProductosFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ProductosFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ProductosFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ProductosFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ProductosFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel CategoriaID;
    private javax.swing.JLabel Nombre;
    private javax.swing.JLabel Precio;
    private javax.swing.JLabel ProductoID;
    private javax.swing.JLabel ProveedorID;
    private javax.swing.JLabel Stock;
    private javax.swing.JTable TableProductos;
    private javax.swing.JButton btnAgregar;
    private javax.swing.JButton btnBuscar;
    private javax.swing.JButton btnEditar;
    private javax.swing.JButton btnEliminar;
    private javax.swing.JButton btnObtenerProductos;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private java.awt.Label label1;
    private javax.swing.JTextField txfCategoriaID;
    private javax.swing.JTextField txfNombre;
    private javax.swing.JTextField txfPrecio;
    private javax.swing.JTextField txfProductoID;
    private javax.swing.JTextField txfProveedorID;
    private javax.swing.JTextField txfStock;
    // End of variables declaration//GEN-END:variables
}
