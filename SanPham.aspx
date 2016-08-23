<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SanPham.aspx.cs" Inherits="SanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="container">

     <div class="row">
				<!--end span8-->


				<div class="span4">

					<ul class="thumb-banner">
						<li>
							
						</li>
					</ul><!--end homeSpecial-->

				</div><!--end span4-->

			</div><!--end row-->



			<div class="row">

				<div class="span12">
					<div id="featuredItems">
						<!-- <div class="span12"> -->
						<div class="titleHeader clearfix">
							<h3>Sản phẩm mới nhất</h3>
							<div class="pagers">
								<div class="btn-toolbar">
									<button class="btn btn-mini">Xem thêm</button>
								</div>
							</div>
						</div><!--end titleHeader-->
						<!-- </div> -->
						<div class="row">
							<ul class="hProductItems clearfix">
                                <asp:Literal ID="ltlProduct" runat="server"/>
							</ul>
						</div><!--end row-->
					</div><!--end featuredItems-->
				</div><!--end span12-->

			</div><!--end row-->
</div> <!-- end container -->
</asp:Content>


