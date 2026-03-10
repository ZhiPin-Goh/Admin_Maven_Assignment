<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if (request.getAttribute("count") == null && request.getAttribute("list") == null) {
        request.getRequestDispatcher("getDashboardStatusCount").forward(request, response);
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header.jsp"/>
</head>
<body>
    <div class="flex h-screen w-full bg-[#f6f8f6] overflow-hidden">
        <jsp:include page="sidebar.jsp"/>

        <div class="flex-1 h-full overflow-y-auto bg-gray-50/50">
          <header class="bg-white border-b border-gray-200 sticky top-0 z-40 px-8 h-20 flex items-center justify-between shadow-sm">
            <div>
              <h2 class="text-xl font-bold text-gray-900">Dashboard</h2>
              <p class="text-sm text-gray-500 mt-0.5">Overview of your store performance</p>
            </div>
            <div class="flex items-center gap-4">
              <div class="relative w-72 hidden md:block">
                <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400 w-5 h-5"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
                <input
                  type="text"
                  placeholder="Search..."
                  class="w-full pl-10 pr-4 py-2 bg-gray-100 border-none rounded-lg text-sm focus:ring-2 focus:ring-[#74A12E]/20 text-gray-700 placeholder-gray-500 outline-none"
                />
              </div>
              <button class="relative p-2 rounded-full text-gray-500 hover:bg-gray-100 transition-colors">
                <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M6 8a6 6 0 0 1 12 0c0 7 3 9 3 9H3s3-2 3-9"/><path d="M10.3 21a1.94 1.94 0 0 0 3.4 0"/></svg>
                <span class="absolute top-2 right-2 w-2 h-2 bg-red-500 rounded-full border-2 border-white"></span>
              </button>
            </div>
          </header>

          <div class="p-8 max-w-[1600px] mx-auto flex flex-col gap-8">
            <c:if test="${not empty errorMessage}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                  <span class="block sm:inline">${errorMessage}</span>
                </div>
            </c:if>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div class="bg-white p-6 rounded-xl border border-gray-200 flex flex-col justify-between h-32 shadow-sm">
                <div class="flex items-start justify-between">
                  <div class="flex flex-col">
                    <span class="text-sm font-medium text-gray-500">Total Revenue</span>
                    <h3 class="text-2xl font-bold text-gray-900 mt-1">RM ${count != null ? count.totalRevenue : '0.00'}</h3>
                  </div>
                  <div class="p-2 bg-green-50 rounded-lg text-green-600">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"/><polyline points="14 2 14 8 20 8"/><line x1="16" x2="8" y1="13" y2="13"/><line x1="16" x2="8" y1="17" y2="17"/><line x1="10" x2="8" y1="9" y2="9"/></svg>
                  </div>
                </div>
                <div class="flex items-center gap-2 mt-auto">
                  <span class="flex items-center text-xs font-semibold text-green-600">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-3 h-3 mr-0.5"><polyline points="22 7 13.5 15.5 8.5 10.5 2 17"/><polyline points="16 7 22 7 22 13"/></svg>
                    Live Revenue
                  </span>
                </div>
              </div>

              <div class="bg-white p-6 rounded-xl border border-gray-200 flex flex-col justify-between h-32 shadow-sm">
                <div class="flex items-start justify-between">
                  <div class="flex flex-col">
                    <span class="text-sm font-medium text-gray-500">Pending Orders</span>
                    <h3 class="text-2xl font-bold text-gray-900 mt-1">${count != null ? count.preparingCount : '0'}</h3>
                  </div>
                  <div class="p-2 bg-orange-50 rounded-lg text-orange-600">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                  </div>
                </div>
                <div class="flex items-center gap-2 mt-auto">
                  <span class="flex items-center text-xs font-semibold text-orange-600">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-3 h-3 mr-0.5"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                    needs attention
                  </span>
                </div>
              </div>

              <div class="bg-white p-6 rounded-xl border border-gray-200 flex flex-col justify-between h-32 shadow-sm">
                <div class="flex items-start justify-between">
                  <div class="flex flex-col">
                    <span class="text-sm font-medium text-gray-500">Total Orders Today</span>
                    <h3 class="text-2xl font-bold text-gray-900 mt-1">${count != null ? count.todayOrderCount : '0'}</h3>
                  </div>
                  <div class="p-2 bg-blue-50 rounded-lg text-blue-600">
                    <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z"/><path d="M3 6h18"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>
                  </div>
                </div>
                <div class="flex items-center gap-2 mt-auto">
                   <span class="flex items-center text-xs font-semibold text-blue-500">
                     Today's metrics
                   </span>
                </div>
              </div>
            </div>

            <div class="flex flex-col gap-5">
              <div class="flex items-center justify-between">
                <h3 class="text-lg font-bold text-gray-900 flex items-center gap-2">
                  Live Incoming Orders
                  <span class="px-2 py-0.5 rounded-full bg-[#74A12E]/10 text-[#74A12E] text-xs font-semibold">Live</span>
                </h3>
              </div>

              <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                <div class="overflow-x-auto">
                  <table class="w-full text-left border-collapse">
                    <thead>
                      <tr class="bg-gray-50/50 border-b border-gray-200">
                        <th class="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Order ID</th>
                        <th class="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Order No</th>
                        <th class="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Customer</th>
                        <th class="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Items</th>
                        <th class="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Time</th>
                        <th class="px-6 py-4 text-xs font-semibold uppercase tracking-wider text-gray-500">Pickup Code</th>
                        <th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-gray-500 text-right">ACTION</th>
                      </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                      <c:forEach var="order" items="${list}">
                          <tr class="hover:bg-gray-50 transition-colors group">
                            <td class="px-6 py-5 whitespace-nowrap">
                              <span class="font-medium text-gray-900">#${order.orderID}</span>
                            </td>
                            <td class="px-6 py-5 whitespace-nowrap">
                              <span class="font-medium text-gray-700">${order.orderNo}</span>
                            </td>
                            <td class="px-6 py-5 whitespace-nowrap">
                               <span class="text-sm font-medium text-gray-700">${order.customerName}</span>
                            </td>
                            <td class="px-6 py-5">
                               <ul class="text-sm text-gray-600">
                                   <c:forEach var="item" items="${order.items}">
                                       <li>${item.beverageName} <span class="text-xs text-gray-400">x${item.quantity}</span><br>
                                       <span class="text-xs text-gray-400">(${item.description})</span>
                                       </li>
                                   </c:forEach>
                               </ul>
                            </td>
                            <td class="px-6 py-5 whitespace-nowrap text-sm text-gray-500">${order.orderTime}</td>
                            <td class="px-6 py-5 whitespace-nowrap text-sm text-gray-500">${order.pickupCode}</td>
                            <td class="px-6 py-5 whitespace-nowrap text-right">
                                <c:choose>
                                    <c:when test="${order.status == 'Preparing'}">
                                        <form action="markAsReady" method="post" class="inline m-0">
                                            <input type="hidden" name="orderID" value="${order.orderID}">
                                            <button type="submit" class="bg-[#7fa833] hover:bg-[#6e922b] text-white font-extrabold py-2 px-5 rounded-md text-sm uppercase cursor-pointer border-none shadow-sm tracking-wide transition-colors">
                                                MARK READY
                                            </button>
                                        </form>
                                    </c:when>
                                    <c:when test="${order.status == 'Ready for Pickup'}">
                                        <form action="markAsComplete" method="post" class="inline m-0">
                                            <input type="hidden" name="orderID" value="${order.orderID}">
                                            <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-extrabold py-2 px-5 rounded-md text-sm uppercase cursor-pointer border-none shadow-sm tracking-wide transition-colors">
                                                COMPLETED
                                            </button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-gray-100 text-gray-800">${order.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                          </tr>
                      </c:forEach>
                      <c:if test="${empty list}">
                         <tr>
                            <td colspan="7" class="px-6 py-8 text-center text-gray-500">No active orders preparing.</td>
                         </tr>
                      </c:if>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

          </div>
        </div>
    </div>
</body>
</html>
