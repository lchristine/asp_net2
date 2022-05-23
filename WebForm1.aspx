<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ApalaktikiErgasia2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Label ID="Label1" runat="server" BorderStyle="Solid" Font-Bold="True" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" ForeColor="#003300" Text="Phone Book" Height="38px" Width="172px"></asp:Label>
            <br /><br />
            <table width="50%">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>

                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="165px" required></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td> 
                        <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label> 

                    </td>
                    <td>  
                        <asp:TextBox ID="TextBox2" runat="server" Width="165px"></asp:TextBox> 

                    </td>
                </tr> 
                <tr>
                    <td> 
                        <asp:Label ID="Label4" runat="server" Text="Phone:"></asp:Label>
                    </td>
                    <td> 
                        <asp:TextBox ID="TextBox3" runat="server" Width="165px" TextMode="Phone" maxlength="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>  
                        <asp:Label ID="Label5" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td> 
                        <asp:TextBox ID="TextBox4" runat="server" Width="165px" TextMode="Email"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>  
                        <asp:Label ID="Label6" runat="server" Text="Address:"></asp:Label>
                    </td>
                    <td> 
                        <asp:TextBox ID="TextBox5" runat="server" Width="165px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <asp:Label ID="Label7" runat="server" Text="Birthday:"></asp:Label> 

                    </td>
                    <td> 
                        <asp:TextBox ID="TextBox6" runat="server" Width="165px" TextMode="DateTime"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <asp:Label ID="Label12" runat="server" Text="Image:"></asp:Label> 

                    </td>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Literal ID="Literal1" runat="server" Text="-"></asp:Literal>
                    </td>
                </tr>
            </table>
            <br />
            <br />            
            <table width="50%" style="height: 96px">
                <tr>
                    <td align="center"><asp:Button ID="Button1" runat="server" Text="Add" Width="80px" OnClick="Button1_Click" /></td>
                    <td align="center"><asp:Button ID="Button2" runat="server" Text="Edit" Width="80px" OnClick="Button2_Click" /></td>
                    <td align="center"><asp:Button ID="Button3" runat="server" Text="Delete" Width="80px" OnClick="Button3_Click" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                 <tr>
                     <td><asp:Label ID="Label8" runat="server" Text="FirstName:"></asp:Label></td>
                     <td align="center"><asp:TextBox ID="TextBox7" runat="server" Width="165px"></asp:TextBox></td>
                     <td align="center"><asp:Button ID="Button4" runat="server" Text="Search" Width="80px" OnClick="Button4_Click" /></td>
                 </tr>
                <tr>
                     <td><asp:Label ID="Label9" runat="server" Text="LastName:"></asp:Label></td>
                     <td align="center"><asp:TextBox ID="TextBox8" runat="server" Width="165px"></asp:TextBox></td>
                     <td align="center">
                         <asp:Button ID="Button5" runat="server" Width="80px" OnClick="Button5_Click" Text="Search" />
                     </td>
                 </tr>
                <tr>
                     <td><asp:Label ID="Label10" runat="server" Text="Phone:"></asp:Label></td>
                     <td align="center"><asp:TextBox ID="TextBox9" runat="server" Width="165px"></asp:TextBox></td>
                     <td align="center">
                         <asp:Button ID="Button6" runat="server" Width="80px" OnClick="Button6_Click" Text="Search" />
                     </td>
                 </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td align="center">
                        <asp:Label ID="Label11" runat="server" Text="  "></asp:Label>
                    </td>
                    <td align="center">&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="239px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
                    <Columns>  
                <asp:TemplateField HeaderText="FirstName">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="LastName">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Address") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        <asp:TemplateField HeaderText="Birthday">  
                    <EditItemTemplate>  
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Birthday") %>'></asp:TextBox>  
                    </EditItemTemplate>  
                    <ItemTemplate>  
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Birthday") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>
                        </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br /><br />
             
            <br /><br />
        </div>
    </form>
</body>
</html>
 