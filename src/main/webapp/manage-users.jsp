<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header.jsp"/>
</head>
<body>
    <div class="flex h-screen w-full bg-[#f6f8f6] overflow-hidden">
        <jsp:include page="sidebar.jsp"/>

        <div class="flex-1 flex flex-col h-full overflow-hidden bg-[#f6f8f6]">
          <header class="px-8 py-6 shrink-0 bg-white border-b border-gray-200 shadow-sm">
            <div class="max-w-[1400px] mx-auto flex flex-col md:flex-row md:justify-between md:items-center gap-6">
              <div>
                <h2 class="text-3xl font-black text-[#0d1b12] tracking-tight">Customer List</h2>
                <p class="text-[#4c9a66] text-sm mt-1">Manage your members and tea enthusiasts.</p>
              </div>
              <div class="flex gap-4">
                <div class="relative w-full md:w-72">
                  <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute left-3 top-1/2 -translate-y-1/2 text-[#4c9a66] w-5 h-5"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.3-4.3"/></svg>
                  <input
                    type="text"
                    placeholder="Search customers..."
                    class="w-full pl-10 pr-4 py-2.5 bg-[#f6f8f6] border border-transparent focus:border-[#13ec5b] focus:ring-0 rounded-lg text-sm text-[#0d1b12] placeholder:text-[#4c9a66] transition-all outline-none"
                  />
                </div>
                <button class="flex items-center gap-2 bg-[#f6f8f6] border border-[#cfe7d7] text-[#0d1b12] px-4 py-2.5 rounded-lg hover:bg-green-100 transition-colors shadow-sm text-sm font-medium">
                  <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg>
                  All Members
                </button>
              </div>
            </div>
          </header>

          <div class="flex-1 overflow-y-auto px-8 py-8">
            <div class="max-w-[1400px] mx-auto">
              
              <c:if test="${not empty errorMessage}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4" role="alert">
                    <span class="block sm:inline">${errorMessage}</span>
                </div>
              </c:if>

              <div class="bg-white rounded-xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col">
                <div class="overflow-x-auto">
                  <table class="w-full text-left border-collapse">
                    <thead>
                      <tr class="bg-[#f6f8f6] border-b border-[#cfe7d7]">
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider">Customer</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider">Email</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider">Phone Number</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider">Usercode</th>
                        <th class="px-6 py-4 text-xs font-semibold text-[#4c9a66] uppercase tracking-wider w-48">Status</th>
                      </tr>
                    </thead>
                    <tbody class="divide-y divide-[#cfe7d7]">
                      <c:forEach var="user" items="${users}">
                          <tr class="group hover:bg-green-50/50 transition-colors">
                            <td class="px-6 py-4">
                              <div class="flex items-center gap-3">
                                <div class="w-10 h-10 rounded-full bg-[#13ec5b]/20 text-green-800 flex items-center justify-center text-sm font-bold uppercase">
                                   ${user.userName.substring(0, 2)}
                                </div>
                                <span class="text-sm font-bold text-[#0d1b12]">${user.userName}</span>
                              </div>
                            </td>
                            <td class="px-6 py-4 text-sm text-gray-600">${user.email}</td>
                            <td class="px-6 py-4 text-sm text-gray-600">${user.phoneNumber}</td>
                            <td class="px-6 py-4">
                              <span class="inline-flex items-center px-2.5 py-1 rounded-md text-xs font-medium bg-gray-100 text-gray-800 font-mono">${user.userCode}</span>
                            </td>
                            <td class="px-6 py-4">
                              <div class="flex flex-col items-start gap-1">
                                <c:choose>
                                    <c:when test="${user.status == 'Active'}">
                                        <div class="w-11 h-6 bg-[#13ec5b] rounded-full relative cursor-pointer">
                                          <div class="w-5 h-5 bg-white rounded-full absolute top-0.5 right-0.5 shadow-sm"></div>
                                        </div>
                                        <span class="text-[10px] text-gray-500">${user.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="w-11 h-6 bg-gray-200 rounded-full relative cursor-pointer">
                                          <div class="w-5 h-5 bg-white rounded-full absolute top-0.5 left-0.5 shadow-sm"></div>
                                        </div>
                                        <span class="text-[10px] text-gray-400">${user.status}</span>
                                    </c:otherwise>
                                </c:choose>
                              </div>
                            </td>
                          </tr>
                      </c:forEach>
                      <c:if test="${empty users}">
                          <tr>
                             <td colspan="5" class="px-6 py-8 text-center text-gray-500">No customers found.</td>
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
