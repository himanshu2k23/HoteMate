/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.28
 * Generated at: 2025-01-18 20:48:05 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.util.List;
import java.util.Map;

public final class hotels_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(4);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(3);
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("java.util.Map");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Manage Hotels</title>\r\n");
      out.write("<link rel=\"stylesheet\"\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\">\r\n");
      out.write("<style>\r\n");
      out.write(".table-responsive-container {\r\n");
      out.write("	max-width: 100%;\r\n");
      out.write("	overflow-x: auto;\r\n");
      out.write("	margin-bottom: 1rem;\r\n");
      out.write("	padding-bottom: 0.5rem;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table-responsive-container::-webkit-scrollbar {\r\n");
      out.write("	height: 8px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table-responsive-container::-webkit-scrollbar-track {\r\n");
      out.write("	background: #f1f1f1;\r\n");
      out.write("	border-radius: 4px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table-responsive-container::-webkit-scrollbar-thumb {\r\n");
      out.write("	background: #888;\r\n");
      out.write("	border-radius: 4px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table-responsive-container::-webkit-scrollbar-thumb:hover {\r\n");
      out.write("	background: #555;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table th, .table td {\r\n");
      out.write("	white-space: nowrap;\r\n");
      out.write("	min-width: 100px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table th:first-child, .table td:first-child {\r\n");
      out.write("	max-width: 30px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table th:nth-child(2), .table td:nth-child(2) {\r\n");
      out.write("	min-width: 150px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table th:nth-child(3), .table td:nth-child(3) {\r\n");
      out.write("	max-width: 230px;\r\n");
      out.write("	overflow: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table th:nth-child(3), .table td:nth-child(14) {\r\n");
      out.write("	max-width: 230px;\r\n");
      out.write("	overflow: auto;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".table th:nth-child(3), .table td:nth-child(15) {\r\n");
      out.write("	max-width: 30px;\r\n");
      out.write("	overflow: auto;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<nav class=\"navbar navbar-expand-lg navbar-dark bg-dark\">\r\n");
      out.write("		<div class=\"container-fluid\">\r\n");
      out.write("			<img src=\"http://localhost:8080/HotelMate/Images/HotelmateLogo.png\"\r\n");
      out.write("				alt=\"HotelMate Logo\" width=\"60\" height=\"45\" class=\"d-inline-block\">\r\n");
      out.write("			<a class=\"navbar-brand\" href=\"#\">HotelMate Admin</a>\r\n");
      out.write("			<button class=\"navbar-toggler\" type=\"button\"\r\n");
      out.write("				data-bs-toggle=\"collapse\" data-bs-target=\"#navbarNav\"\r\n");
      out.write("				aria-controls=\"navbarNav\" aria-expanded=\"false\"\r\n");
      out.write("				aria-label=\"Toggle navigation\">\r\n");
      out.write("				<span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("			</button>\r\n");
      out.write("			<div class=\"collapse navbar-collapse\" id=\"navbarNav\">\r\n");
      out.write("				<ul class=\"navbar-nav ms-auto\">\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link\"\r\n");
      out.write("						href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/admin/logout\">Logout</a>\r\n");
      out.write("					</li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("	<div class=\"container my-4\">\r\n");
      out.write("\r\n");
      out.write("		<h1 class=\"text-center mb-4\">Hotel Management</h1>\r\n");
      out.write("\r\n");
      out.write("		");

		String successMsg = request.getParameter("successMsg");
		String errorMsg = request.getParameter("errorMsg");
		if (successMsg != null) {
		
      out.write("\r\n");
      out.write("		<div class=\"alert alert-success\">");
      out.print(successMsg);
      out.write("</div>\r\n");
      out.write("		");

		}
		if (errorMsg != null) {
		
      out.write("\r\n");
      out.write("		<div class=\"alert alert-danger\">");
      out.print(errorMsg);
      out.write("</div>\r\n");
      out.write("		");

		}
		
      out.write("\r\n");
      out.write("\r\n");
      out.write("		<div class=\"mb-3 text-end\">\r\n");
      out.write("			<button class=\"btn btn-success\" data-bs-toggle=\"modal\"\r\n");
      out.write("				data-bs-target=\"#addUpdateModal\" onclick=\"clearModal()\">Add\r\n");
      out.write("				New Hotel</button>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"table-responsive-container\">\r\n");
      out.write("			<table class=\"table table-bordered table-hover\">\r\n");
      out.write("				<thead class=\"table-dark\">\r\n");
      out.write("					<tr>\r\n");
      out.write("						<th>ID</th>\r\n");
      out.write("						<th>Name</th>\r\n");
      out.write("						<th>Description</th>\r\n");
      out.write("						<th>Location</th>\r\n");
      out.write("						<th>City</th>\r\n");
      out.write("						<th>State</th>\r\n");
      out.write("						<th>Country</th>\r\n");
      out.write("						<th>Zip Code</th>\r\n");
      out.write("						<th>Price/Night</th>\r\n");
      out.write("						<th>Rating</th>\r\n");
      out.write("						<th>Amenities</th>\r\n");
      out.write("						<th>Contact Email</th>\r\n");
      out.write("						<th>Contact Phone</th>\r\n");
      out.write("						<th>Images</th>\r\n");
      out.write("						<th>Available Rooms</th>\r\n");
      out.write("						<th>Created At</th>\r\n");
      out.write("						<th>Updated At</th>\r\n");
      out.write("						<th>Actions</th>\r\n");
      out.write("					</tr>\r\n");
      out.write("				</thead>\r\n");
      out.write("				<tbody>\r\n");
      out.write("					");

					List<Map<String, Object>> hotels = (List<Map<String, Object>>) request.getAttribute("hotels");
					if (hotels != null) {
						for (Map<String, Object> hotel : hotels) {
					
      out.write("\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td>");
      out.print(hotel.get("hotel_id"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("name"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("description"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("location"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("city"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("state"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("country"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("zip_code"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("price_per_night"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("rating"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("amenities"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("contact_email"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("contact_phone"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("images"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("available_rooms"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("created_at"));
      out.write("</td>\r\n");
      out.write("						<td>");
      out.print(hotel.get("updated_at"));
      out.write("</td>\r\n");
      out.write("						<td>\r\n");
      out.write("							<button class=\"btn btn-primary btn-sm\" data-bs-toggle=\"modal\"\r\n");
      out.write("								data-bs-target=\"#addUpdateModal\"\r\n");
      out.write("								onclick=\"populateModal(");
      out.print(hotel.get("hotel_id"));
      out.write(',');
      out.write(' ');
      out.write('\'');
      out.print(hotel.get("name"));
      out.write("', \r\n");
      out.write("                            '");
      out.print(hotel.get("description"));
      out.write("', '");
      out.print(hotel.get("location"));
      out.write("', '");
      out.print(hotel.get("city"));
      out.write("', \r\n");
      out.write("                            '");
      out.print(hotel.get("state"));
      out.write("', '");
      out.print(hotel.get("country"));
      out.write("', '");
      out.print(hotel.get("zip_code"));
      out.write("', \r\n");
      out.write("                            '");
      out.print(hotel.get("price_per_night"));
      out.write("', '");
      out.print(hotel.get("rating"));
      out.write("', '");
      out.print(hotel.get("amenities"));
      out.write("', \r\n");
      out.write("                            '");
      out.print(hotel.get("contact_email"));
      out.write("', '");
      out.print(hotel.get("contact_phone"));
      out.write("', '");
      out.print(hotel.get("images"));
      out.write("', \r\n");
      out.write("                            '");
      out.print(hotel.get("available_rooms"));
      out.write("')\">Update</button>\r\n");
      out.write("							<form action=\"/HotelMate/admin/hotels\" method=\"post\"\r\n");
      out.write("								class=\"d-inline\">\r\n");
      out.write("								<input type=\"hidden\" name=\"action\" value=\"delete\"> <input\r\n");
      out.write("									type=\"hidden\" name=\"id\" value=\"");
      out.print(hotel.get("hotel_id"));
      out.write("\">\r\n");
      out.write("								<button type=\"submit\" class=\"btn btn-danger btn-sm\"\r\n");
      out.write("									onclick=\"return confirm('Are you sure you want to delete this hotel?')\">Delete</button>\r\n");
      out.write("							</form>\r\n");
      out.write("						</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					");

					}
					} else {
					
      out.write("\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td colspan=\"18\" class=\"text-center\">No hotels found</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					");

					}
					
      out.write("\r\n");
      out.write("				</tbody>\r\n");
      out.write("			</table>\r\n");
      out.write("		</div>\r\n");
      out.write("		<a href=\"");
      out.print(request.getContextPath());
      out.write("/admin/dashboard\"\r\n");
      out.write("			class=\"btn btn-primary mt-3\">Back to Dashboard</a>\r\n");
      out.write("	</div>\r\n");
      out.write("	<footer class=\"bg-dark text-white text-center py-3 mt-5\">\r\n");
      out.write("		<p>© HotelMate 2025 - All rights reserved</p>\r\n");
      out.write("	</footer>\r\n");
      out.write("\r\n");
      out.write("	<div class=\"modal fade\" id=\"addUpdateModal\" tabindex=\"-1\"\r\n");
      out.write("		aria-labelledby=\"modalLabel\" aria-hidden=\"true\">\r\n");
      out.write("		<div class=\"modal-dialog modal-lg\">\r\n");
      out.write("			<div class=\"modal-content\">\r\n");
      out.write("				<form action=\"/HotelMate/admin/hotels\" method=\"post\">\r\n");
      out.write("					<input type=\"hidden\" name=\"action\" id=\"modal-action\" value=\"add\">\r\n");
      out.write("					<input type=\"hidden\" name=\"hotel_id\" id=\"modal-hotel-id\">\r\n");
      out.write("					<div class=\"modal-header\">\r\n");
      out.write("						<h5 class=\"modal-title\" id=\"modalLabel\">Add / Update Hotel</h5>\r\n");
      out.write("						<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\"\r\n");
      out.write("							aria-label=\"Close\"></button>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"modal-body\">\r\n");
      out.write("						<div class=\"row\">\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-name\" class=\"form-label\">Name</label> <input\r\n");
      out.write("									type=\"text\" class=\"form-control\" id=\"modal-hotel-name\"\r\n");
      out.write("									name=\"name\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-description\" class=\"form-label\">Description</label>\r\n");
      out.write("								<textarea class=\"form-control\" id=\"modal-hotel-description\"\r\n");
      out.write("									name=\"description\" required></textarea>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-location\" class=\"form-label\">Location</label>\r\n");
      out.write("								<input type=\"text\" class=\"form-control\"\r\n");
      out.write("									id=\"modal-hotel-location\" name=\"location\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-city\" class=\"form-label\">City</label> <input\r\n");
      out.write("									type=\"text\" class=\"form-control\" id=\"modal-hotel-city\"\r\n");
      out.write("									name=\"city\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-state\" class=\"form-label\">State</label>\r\n");
      out.write("								<input type=\"text\" class=\"form-control\" id=\"modal-hotel-state\"\r\n");
      out.write("									name=\"state\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-country\" class=\"form-label\">Country</label>\r\n");
      out.write("								<input type=\"text\" class=\"form-control\" id=\"modal-hotel-country\"\r\n");
      out.write("									name=\"country\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-zip\" class=\"form-label\">Zip Code</label>\r\n");
      out.write("								<input type=\"text\" class=\"form-control\" id=\"modal-hotel-zip\"\r\n");
      out.write("									name=\"zip_code\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-price\" class=\"form-label\">Price/Night</label>\r\n");
      out.write("								<input type=\"number\" step=\"0.01\" class=\"form-control\"\r\n");
      out.write("									id=\"modal-hotel-price\" name=\"price_per_night\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-rating\" class=\"form-label\">Rating</label>\r\n");
      out.write("								<input type=\"number\" step=\"0.1\" class=\"form-control\"\r\n");
      out.write("									id=\"modal-hotel-rating\" name=\"rating\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-amenities\" class=\"form-label\">Amenities</label>\r\n");
      out.write("								<textarea class=\"form-control\" id=\"modal-hotel-amenities\"\r\n");
      out.write("									name=\"amenities\" required></textarea>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-email\" class=\"form-label\">Contact\r\n");
      out.write("									Email</label> <input type=\"email\" class=\"form-control\"\r\n");
      out.write("									id=\"modal-hotel-email\" name=\"contact_email\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-phone\" class=\"form-label\">Contact\r\n");
      out.write("									Phone</label> <input type=\"text\" class=\"form-control\"\r\n");
      out.write("									id=\"modal-hotel-phone\" name=\"contact_phone\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-images\" class=\"form-label\">Images</label>\r\n");
      out.write("								<textarea class=\"form-control\" id=\"modal-hotel-images\"\r\n");
      out.write("									name=\"images\" required></textarea>\r\n");
      out.write("							</div>\r\n");
      out.write("							<div class=\"col-md-6 mb-3\">\r\n");
      out.write("								<label for=\"modal-hotel-rooms\" class=\"form-label\">Available\r\n");
      out.write("									Rooms</label> <input type=\"number\" class=\"form-control\"\r\n");
      out.write("									id=\"modal-hotel-rooms\" name=\"available_rooms\" required>\r\n");
      out.write("							</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</div>\r\n");
      out.write("					<div class=\"modal-footer\">\r\n");
      out.write("						<button type=\"button\" class=\"btn btn-secondary\"\r\n");
      out.write("							data-bs-dismiss=\"modal\">Close</button>\r\n");
      out.write("						<button type=\"submit\" class=\"btn btn-primary\">Save</button>\r\n");
      out.write("					</div>\r\n");
      out.write("				</form>\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("	<script>\r\n");
      out.write("	\r\n");
      out.write("	function clearModal() {\r\n");
      out.write("	    document.getElementById('modal-action').value = 'add';\r\n");
      out.write("	    document.getElementById('modal-hotel-id').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-name').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-description').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-location').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-city').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-state').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-country').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-zip').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-price').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-rating').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-amenities').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-email').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-phone').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-images').value = '';\r\n");
      out.write("	    document.getElementById('modal-hotel-rooms').value = '';\r\n");
      out.write("	}\r\n");
      out.write("\r\n");
      out.write("	function populateModal(id, name, description, location, city, state, country, zip, price, rating, amenities, email, phone, images, rooms) {\r\n");
      out.write("	    document.getElementById('modal-action').value = 'update';\r\n");
      out.write("	    document.getElementById('modal-hotel-id').value = id;\r\n");
      out.write("	    document.getElementById('modal-hotel-name').value = name;\r\n");
      out.write("	    document.getElementById('modal-hotel-description').value = description;\r\n");
      out.write("	    document.getElementById('modal-hotel-location').value = location;\r\n");
      out.write("	    document.getElementById('modal-hotel-city').value = city;\r\n");
      out.write("	    document.getElementById('modal-hotel-state').value = state;\r\n");
      out.write("	    document.getElementById('modal-hotel-country').value = country;\r\n");
      out.write("	    document.getElementById('modal-hotel-zip').value = zip;\r\n");
      out.write("	    document.getElementById('modal-hotel-price').value = price;\r\n");
      out.write("	    document.getElementById('modal-hotel-rating').value = rating;\r\n");
      out.write("	    document.getElementById('modal-hotel-amenities').value = amenities;\r\n");
      out.write("	    document.getElementById('modal-hotel-email').value = email;\r\n");
      out.write("	    document.getElementById('modal-hotel-phone').value = phone;\r\n");
      out.write("	    document.getElementById('modal-hotel-images').value = images;\r\n");
      out.write("	    document.getElementById('modal-hotel-rooms').value = rooms;\r\n");
      out.write("	}\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
