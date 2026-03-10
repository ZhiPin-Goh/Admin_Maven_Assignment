<%-- sidebar.jsp --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="w-64 bg-white h-full flex flex-col border-r border-[#cfe7d7] shrink-0">
  <div class="p-6 pb-2">
    <div class="flex flex-col">
      <h1 class="text-[#0d1b12] text-xl font-bold leading-normal tracking-tight">Tea Admin</h1>
      <p class="text-[#4c9a66] text-xs font-medium uppercase tracking-wider mt-1">Management Portal</p>
    </div>
  </div>
  <nav class="flex-1 px-4 py-4 flex flex-col gap-2 overflow-y-auto">
      <a href="getDashboardStatusCount" class="flex items-center gap-3 px-3 py-3 rounded-lg transition-colors group <%= request.getRequestURI().endsWith("index.jsp") || request.getRequestURI().endsWith("getDashboardStatusCount") ? "bg-[#13ec5b]/20 text-green-900 font-bold" : "hover:bg-[#f6f8f6] text-gray-600 font-medium" %>">
        <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 <%= request.getRequestURI().endsWith("index.jsp") || request.getRequestURI().endsWith("getDashboardStatusCount") ? "text-green-800" : "text-gray-500 group-hover:text-[#0d1b12]" %>"><rect width="7" height="9" x="3" y="3" rx="1"/><rect width="7" height="5" x="14" y="3" rx="1"/><rect width="7" height="9" x="14" y="12" rx="1"/><rect width="7" height="5" x="3" y="16" rx="1"/></svg>
        <span class="<%= request.getRequestURI().endsWith("index.jsp") || request.getRequestURI().endsWith("getDashboardStatusCount") ? "text-green-900" : "group-hover:text-[#0d1b12]" %>">Dashboard</span>
      </a>
      <a href="ordersList" class="flex items-center gap-3 px-3 py-3 rounded-lg transition-colors group <%= request.getRequestURI().endsWith("manage-orders.jsp") || request.getRequestURI().endsWith("ordersList") ? "bg-[#13ec5b]/20 text-green-900 font-bold" : "hover:bg-[#f6f8f6] text-gray-600 font-medium" %>">
        <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 <%= request.getRequestURI().endsWith("manage-orders.jsp") || request.getRequestURI().endsWith("ordersList") ? "text-green-800" : "text-gray-500 group-hover:text-[#0d1b12]" %>"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z"/><path d="M3 6h18"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>
        <span class="<%= request.getRequestURI().endsWith("manage-orders.jsp") || request.getRequestURI().endsWith("ordersList") ? "text-green-900" : "group-hover:text-[#0d1b12]" %>">Orders</span>
      </a>
      <a href="beverages" class="flex items-center gap-3 px-3 py-3 rounded-lg transition-colors group <%= request.getRequestURI().endsWith("manage-beverage.jsp") || request.getRequestURI().endsWith("beverages") ? "bg-[#13ec5b]/20 text-green-900 font-bold" : "hover:bg-[#f6f8f6] text-gray-600 font-medium" %>">
        <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 <%= request.getRequestURI().endsWith("manage-beverage.jsp") || request.getRequestURI().endsWith("beverages") ? "text-green-800" : "text-gray-500 group-hover:text-[#0d1b12]" %>"><path d="M3 2v7c0 1.1.9 2 2 2h4a2 2 0 0 0 2-2V2"/><path d="M7 2v20"/><path d="M21 15V2v0a5 5 0 0 0-5 5v6c0 1.1.9 2 2 2h3Zm0 0v7"/></svg>
        <span class="<%= request.getRequestURI().endsWith("manage-beverage.jsp") || request.getRequestURI().endsWith("beverages") ? "text-green-900" : "group-hover:text-[#0d1b12]" %>">Menu Management</span>
      </a>
      <a href="drinkOptions" class="flex items-center gap-3 px-3 py-3 rounded-lg transition-colors group <%= request.getRequestURI().endsWith("drink-option.jsp") || request.getRequestURI().endsWith("drinkOptions") ? "bg-[#13ec5b]/20 text-green-900 font-bold" : "hover:bg-[#f6f8f6] text-gray-600 font-medium" %>">
        <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 <%= request.getRequestURI().endsWith("drink-option.jsp") || request.getRequestURI().endsWith("drinkOptions") ? "text-green-800" : "text-gray-500 group-hover:text-[#0d1b12]" %>"><path d="M20 7h-9"/><path d="M14 17H5"/><circle cx="17" cy="17" r="3"/><circle cx="8" cy="7" r="3"/></svg>
        <span class="<%= request.getRequestURI().endsWith("drink-option.jsp") || request.getRequestURI().endsWith("drinkOptions") ? "text-green-900" : "group-hover:text-[#0d1b12]" %>">Drink Options</span>
      </a>
      <a href="users" class="flex items-center gap-3 px-3 py-3 rounded-lg transition-colors group <%= request.getRequestURI().endsWith("manage-users.jsp") || request.getRequestURI().endsWith("users") ? "bg-[#13ec5b]/20 text-green-900 font-bold" : "hover:bg-[#f6f8f6] text-gray-600 font-medium" %>">
        <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5 <%= request.getRequestURI().endsWith("manage-users.jsp") || request.getRequestURI().endsWith("users") ? "text-green-800" : "text-gray-500 group-hover:text-[#0d1b12]" %>"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
        <span class="<%= request.getRequestURI().endsWith("manage-users.jsp") || request.getRequestURI().endsWith("users") ? "text-green-900" : "group-hover:text-[#0d1b12]" %>">Customers</span>
      </a>
  </nav>
  <div class="p-4 border-t border-[#cfe7d7] flex flex-col gap-4">
    <div class="flex items-center gap-3 px-3 py-2 rounded-lg bg-[#f6f8f6]">
      <div class="h-8 w-8 rounded-full bg-gradient-to-tr from-[#13ec5b] to-green-200 overflow-hidden relative">
        <img
          src="https://lh3.googleusercontent.com/aida-public/AB6AXuCULtVoMytBAzWa69q5FeQOLO7B-AbDF0zUBu8XvXDrIX6KCy8_Gxgi9zHMdQpHccmPIkCpYywijuueORBeT9v1HJx35JfS0URuXbxDstdax_1nlAqf0NkePhHegJzINEYtZtipfesyocK9DFqbkxSS7iaJ08FYDkuKnl6c830Cj4EqY3CVndWqNwYG0sVzTjSZu0MPtfvyqziDKlXoRbfMDTqQGXWcJ-wU3budKh2AoP-czrWwuVZf7tf3AlA4S7_Cr-Gtdiueqxo"
          alt="Admin"
          class="w-full h-full object-cover"
          referrerpolicy="no-referrer"
        />
      </div>
      <div class="flex flex-col text-left">
        <p class="text-sm font-semibold text-[#0d1b12]"><%= session.getAttribute("admin") != null ? session.getAttribute("admin") : "Admin" %></p>
        <p class="text-xs text-[#4c9a66]">Store Manager</p>
      </div>
    </div>

    <form action="logout" method="get" class="m-0 p-0 w-full">
        <button
          type="submit"
          class="flex items-center gap-3 px-3 py-2 rounded-lg text-red-600 hover:bg-red-50 font-medium transition-colors w-full"
        >
          <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" x2="9" y1="12" y2="12"/></svg>
          <span>Logout</span>
        </button>
    </form>
  </div>
</aside>
