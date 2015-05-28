<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<asp:Content ID="nav" ContentPlaceHolderID="navigation" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
    <div style="text-align:center">
        <asp:Label  ID="Label2" Font-Size="X-Large"  runat="server" BackColor="Red" ForeColor="White" 
            Height="56px" Width="635px" ></asp:Label></div>
        <br />
        <br />
&nbsp;
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="show all users" 
            onclick="Button1_Click" CausesValidation="False" Width="146px" 
            BackColor="Red" ForeColor="White" Height="37px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button 
            ID="Button7" runat="server" onclick="Button7_Click" 
            Text="ChangePassword" CausesValidation="False" BackColor="Red" 
            ForeColor="White" Height="37px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:Button 
            ID="Button6" runat="server" onclick="Button6_Click" Text="LogOut" 
            CausesValidation="False" 
            
            style="height: 36px; position: relative; top: 0px; left: 0px; width: 144px;" 
            BackColor="Red" ForeColor="White" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="false">
            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="username" DataSourceID="SqlDataSource4" 
                ForeColor="#333333" GridLines="None" 
                onselectedindexchanged="GridView4_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="username" HeaderText="username" ReadOnly="True" 
                        SortExpression="username" />
                    <asp:BoundField DataField="password" HeaderText="password" 
                        SortExpression="password" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbcs %>" 
                DeleteCommand="DELETE FROM [userdetails] WHERE [username] = @username" 
                InsertCommand="INSERT INTO [userdetails] ([username], [password]) VALUES (@username, @password)" 
                SelectCommand="SELECT * FROM [userdetails]" 
                UpdateCommand="UPDATE [userdetails] SET [password] = @password WHERE [username] = @username">
                <DeleteParameters>
                    <asp:Parameter Name="username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="username" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </asp:Panel>
        <br />
        <br />
    
        <asp:Button ID="Button2" runat="server" Text="show news" 
            onclick="Button2_Click" CausesValidation="False" Width="146px" 
            BackColor="Red" ForeColor="White" Height="36px" />
    <asp:Panel ID="Panel2" runat="server" Visible="false">
        <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="newsid" 
            DataSourceID="SqlDataSource5" onrowdeleting="GridView5_RowDeleting" 
            onselectedindexchanged="GridView5_SelectedIndexChanged" Width="600px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="newsid" HeaderText="newsid" ReadOnly="True" 
                    SortExpression="newsid" />
                <asp:BoundField DataField="newsheader" HeaderText="newsheader" 
                    SortExpression="newsheader" >
                </asp:BoundField>
                <asp:BoundField DataField="newstext" HeaderText="newstext" 
                    SortExpression="newstext" >
                </asp:BoundField>
                <asp:BoundField DataField="newsdate" HeaderText="newsdate" 
                    SortExpression="newsdate" >
                <ControlStyle Width="50px" />
                <ItemStyle Width="50px" />
                </asp:BoundField>
                <asp:BoundField DataField="newstype" HeaderText="newstype" 
                    SortExpression="newstype" >
                <ControlStyle Height="70px" />
                <ItemStyle Width="70px" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="image1path" HeaderText="image1" 
                    SortExpression="image1path">
                    <ControlStyle Height="100px" Width="50px" />
                    <ItemStyle Height="100px" Width="50px" />
                </asp:ImageField>
                <asp:ImageField DataImageUrlField="image2path" HeaderText="image2">
                    <ControlStyle Height="100px" Width="50px" />
                    <ItemStyle Height="100px" Width="50px" />
                </asp:ImageField>
                <asp:CheckBoxField DataField="approvenews" HeaderText="approve" 
                    SortExpression="approvenews" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbcs %>" 
            DeleteCommand="DELETE FROM [news] WHERE [newsid] = @newsid" 
            InsertCommand="INSERT INTO [news] ([newsid], [newsheader], [newstext], [newsdate], [newstype], [image1path], [image2path], [approvenews]) VALUES (@newsid, @newsheader, @newstext, @newsdate, @newstype, @image1path, @image2path, @approvenews)" 
            SelectCommand="SELECT * FROM [news]" 
            
            UpdateCommand="UPDATE [news] SET [newsheader] = @newsheader, [newstext] = @newstext, [newsdate] = @newsdate, [newstype] = @newstype, [image1path] = @image1path, [image2path] = @image2path, [approvenews] = @approvenews WHERE [newsid] = @newsid">
            <DeleteParameters>
                <asp:Parameter Name="newsid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="newsid" Type="Int32" />
                <asp:Parameter Name="newsheader" Type="String" />
                <asp:Parameter Name="newstext" Type="String" />
                <asp:Parameter Name="newsdate" Type="String" />
                <asp:Parameter Name="newstype" Type="String" />
                <asp:Parameter Name="image1path" Type="String" />
                <asp:Parameter Name="image2path" Type="String" />
                <asp:Parameter Name="approvenews" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="newsheader" Type="String" />
                <asp:Parameter Name="newstext" Type="String" />
                <asp:Parameter Name="newsdate" Type="String" />
                <asp:Parameter Name="newstype" Type="String" />
                <asp:Parameter Name="image1path" Type="String" />
                <asp:Parameter Name="image2path" Type="String" />
                <asp:Parameter Name="approvenews" Type="Boolean" />
                <asp:Parameter Name="newsid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        </asp:Panel>
        <br />
        <br />

         <asp:Button ID="Button3" runat="server" Text="show complaints" 
            onclick="Button3_Click" CausesValidation="False" Width="148px" 
            BackColor="Red" ForeColor="White" Height="37px" />
    <asp:Panel ID="Panel3" runat="server" Visible="false">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="complaintext" HeaderText="complaintext" 
                    SortExpression="complaintext" />
                <asp:BoundField DataField="complaindate" HeaderText="complaindate" 
                    SortExpression="complaindate" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dbcs %>" 
            SelectCommand="SELECT * FROM [usercomplain]"></asp:SqlDataSource>
        </asp:Panel>
        <br />
        <br />
         <asp:Button ID="Button4" runat="server" Text="upload advertisements" 
            onclick="Button4_Click" CausesValidation="False" Width="146px" 
            BackColor="Red" ForeColor="White" Height="37px" />
    <asp:Panel ID="Panel4" runat="server" Visible="false" Height="86px">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="select an image" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="Button8" runat="server" Text="upload" onclick="Button8_Click" 
            BackColor="Red" ForeColor="White" Height="33px" Width="67px" />
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
        </asp:Panel>
        <br />
        <br />
         <asp:Button ID="Button9" runat="server" Text="Show advertisements" 
            onclick="Button9_Click" CausesValidation="False" Width="145px" 
            BackColor="Red" ForeColor="White" Height="36px" />
        <asp:Panel ID="Panel6" runat="server" Visible="false" >             
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="imageid" DataSourceID="SqlDataSource1" 
                onrowdeleting="GridView1_RowDeleting" AllowPaging="True" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:ImageField DataImageUrlField="imagepath" HeaderText="ads" 
                        SortExpression="imagepath">
                        <ControlStyle Height="200px" Width="200px" />
                        <ItemStyle Height="200px" Width="200px" />
                    </asp:ImageField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dbcs %>" 
                DeleteCommand="DELETE FROM [advertisements] WHERE [imageid] = @imageid" 
                InsertCommand="INSERT INTO [advertisements] ([imagepath], [imageid]) VALUES (@imagepath, @imageid)" 
                SelectCommand="SELECT * FROM [advertisements]" 
                UpdateCommand="UPDATE [advertisements] SET [imagepath] = @imagepath WHERE [imageid] = @imageid">
                <DeleteParameters>
                    <asp:Parameter Name="imageid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="imagepath" Type="String" />
                    <asp:Parameter Name="imageid" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="imagepath" Type="String" />
                    <asp:Parameter Name="imageid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </asp:Panel>
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" Text="Add more admin" 
            onclick="Button5_Click" CausesValidation="False" Width="146px" 
            BackColor="Red" ForeColor="White" Height="37px" />
            <asp:Panel ID="Panel5" runat="server" Visible="false">
            <table style="width: 31%;">
            <tr>
                <td>
                enter user name 
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    &nbsp;</td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                
            </tr>
            <tr>
                <td>
                enter password
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;</td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                
            </tr>
            <tr>
                <td>
                reenter password
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;</td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="password is reqired" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="enter same password" ControlToValidate="TextBox3" ControlToCompare="TextBox2"></asp:CompareValidator>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="303px">
                        <asp:ListItem>What is your favourite color</asp:ListItem>
                        <asp:ListItem >What is your birth city</asp:ListItem>
                        <asp:ListItem>What is your hobby</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;</td>
               
                
            </tr>
             <tr>
                <td colspan="2">
                    <asp:TextBox ID="TextBox4" runat="server" Width="295px"></asp:TextBox>
                    &nbsp;</td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="enter yor answer" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
               
                
            </tr>

             <tr>
                <td colspan="2">
                    <asp:Button ID="signup" runat="server" Text="submit" onclick="signup_Click" 
                        Height="34px" BackColor="Red" ForeColor="White" />
                    &nbsp;</td>
               
                
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary= "true" />
                    <br />
                    </td>
               
                
            </tr>
        </table>
        </asp:Panel>
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContetPlaceHolder5" Runat="Server">
</asp:Content>