<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Free-text-admin.aspx.cs" Inherits="Free_text_admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:botConnectionString_170 %>" DeleteCommand="DELETE FROM [Tbl_FreeText_keyWords] WHERE [Id] = @original_Id AND (([KeyWords] = @original_KeyWords) OR ([KeyWords] IS NULL AND @original_KeyWords IS NULL)) AND (([Response] = @original_Response) OR ([Response] IS NULL AND @original_Response IS NULL))" InsertCommand="INSERT INTO [Tbl_FreeText_keyWords] ([KeyWords], [Response]) VALUES (@KeyWords, @Response)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id], [KeyWords], [Response] FROM [Tbl_FreeText_keyWords]" UpdateCommand="UPDATE [Tbl_FreeText_keyWords] SET [KeyWords] = @KeyWords, [Response] = @Response WHERE [Id] = @original_Id AND (([KeyWords] = @original_KeyWords) OR ([KeyWords] IS NULL AND @original_KeyWords IS NULL)) AND (([Response] = @original_Response) OR ([Response] IS NULL AND @original_Response IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_KeyWords" Type="String" />
                <asp:Parameter Name="original_Response" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="KeyWords" Type="String" />
                <asp:Parameter Name="Response" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="KeyWords" Type="String" />
                <asp:Parameter Name="Response" Type="String" />
                <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_KeyWords" Type="String" />
                <asp:Parameter Name="original_Response" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="1083px"
            PageSize="50">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"></asp:CommandField>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id"></asp:BoundField>
                <asp:BoundField DataField="KeyWords" HeaderText="KeyWords" SortExpression="KeyWords"></asp:BoundField>
                <asp:BoundField DataField="Response" HeaderText="Response" SortExpression="Response"></asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <sortedascendingcellstyle backcolor="#F5F7FB" />
            <sortedascendingheaderstyle backcolor="#6D95E1" />
            <sorteddescendingcellstyle backcolor="#E9EBEF" />
            <sorteddescendingheaderstyle backcolor="#4870BE" />
        </asp:GridView>
    </form>
</body>
</html>
