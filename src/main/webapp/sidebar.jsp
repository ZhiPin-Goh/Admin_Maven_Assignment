<%-- sidebar.jsp --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <% String uri=request.getRequestURI(); boolean isDashboard=uri.endsWith("index.jsp") ||
      uri.endsWith("getDashboardStatusCount"); boolean isOrders=uri.endsWith("manage-orders.jsp") ||
      uri.endsWith("ordersList"); boolean isBeverages=uri.endsWith("manage-beverage.jsp") || uri.endsWith("beverages");
      boolean isDrinkOptions=uri.endsWith("drink-option.jsp") || uri.endsWith("drinkOptions"); boolean
      isUsers=uri.endsWith("manage-users.jsp") || uri.endsWith("users"); String
      activeClass="bg-[#f2fbf7] text-[#0b3e2e] font-bold shadow-sm border border-[#2ee59d]/20" ; String
      inactiveClass="hover:bg-gray-50 text-gray-500 font-medium" ; String activeIconClass="text-[#2ee59d]" ; String
      inactiveIconClass="text-gray-400 group-hover:text-[#2ee59d] transition-colors" ; String
      activeTextClass="text-[#0b3e2e]" ; String inactiveTextClass="group-hover:text-[#0b3e2e] transition-colors" ; %>
      <aside class="w-64 bg-white h-full flex flex-col border-r border-gray-100 shrink-0 shadow-sm">
        <div class="p-6 pb-2">
          <div class="flex flex-col">
            <h1 class="text-[#0b3e2e] text-2xl font-serif font-bold leading-normal tracking-wide">Zen Tea</h1>
            <p class="text-[#8bb3a3] text-[10px] font-semibold uppercase tracking-widest mt-1">Management Portal</p>
          </div>
        </div>
        <nav class="flex-1 px-4 py-4 flex flex-col gap-2 overflow-y-auto mt-2">
          <a href="getDashboardStatusCount"
            class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-200 group <%= isDashboard ? activeClass : inactiveClass %>">
            <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
              class="w-5 h-5 <%= isDashboard ? activeIconClass : inactiveIconClass %>">
              <rect width="7" height="9" x="3" y="3" rx="1" />
              <rect width="7" height="5" x="14" y="3" rx="1" />
              <rect width="7" height="9" x="14" y="12" rx="1" />
              <rect width="7" height="5" x="3" y="16" rx="1" />
            </svg>
            <span class="<%= isDashboard ? activeTextClass : inactiveTextClass %>">Dashboard</span>
          </a>
          <a href="ordersList"
            class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-200 group <%= isOrders ? activeClass : inactiveClass %>">
            <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
              class="w-5 h-5 <%= isOrders ? activeIconClass : inactiveIconClass %>">
              <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4Z" />
              <path d="M3 6h18" />
              <path d="M16 10a4 4 0 0 1-8 0" />
            </svg>
            <span class="<%= isOrders ? activeTextClass : inactiveTextClass %>">Orders</span>
          </a>
          <a href="beverages"
            class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-200 group <%= isBeverages ? activeClass : inactiveClass %>">
            <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
              class="w-5 h-5 <%= isBeverages ? activeIconClass : inactiveIconClass %>">
              <path d="M3 2v7c0 1.1.9 2 2 2h4a2 2 0 0 0 2-2V2" />
              <path d="M7 2v20" />
              <path d="M21 15V2v0a5 5 0 0 0-5 5v6c0 1.1.9 2 2 2h3Zm0 0v7" />
            </svg>
            <span class="<%= isBeverages ? activeTextClass : inactiveTextClass %>">Menu Management</span>
          </a>
          <a href="drinkOptions"
            class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-200 group <%= isDrinkOptions ? activeClass : inactiveClass %>">
            <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
              class="w-5 h-5 <%= isDrinkOptions ? activeIconClass : inactiveIconClass %>">
              <path d="M20 7h-9" />
              <path d="M14 17H5" />
              <circle cx="17" cy="17" r="3" />
              <circle cx="8" cy="7" r="3" />
            </svg>
            <span class="<%= isDrinkOptions ? activeTextClass : inactiveTextClass %>">Drink Options</span>
          </a>
          <a href="users"
            class="flex items-center gap-3 px-3 py-3 rounded-lg transition-all duration-200 group <%= isUsers ? activeClass : inactiveClass %>">
            <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
              class="w-5 h-5 <%= isUsers ? activeIconClass : inactiveIconClass %>">
              <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
              <circle cx="9" cy="7" r="4" />
              <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
              <path d="M16 3.13a4 4 0 0 1 0 7.75" />
            </svg>
            <span class="<%= isUsers ? activeTextClass : inactiveTextClass %>">Customers</span>
          </a>
        </nav>
        <div class="p-6 border-t border-gray-100 flex flex-col gap-4">
          <div class="flex items-center gap-3 px-4 py-3 rounded-xl bg-[#fdfdfd] border border-gray-100 shadow-sm">
            <div
              class="h-10 w-10 rounded-full bg-gradient-to-tr from-[#2ee59d] to-[#dcfce7] overflow-hidden relative shadow-inner">
              <img
                src="https://lh3.googleusercontent.com/aida-public/AB6AXuCULtVoMytBAzWa69q5FeQOLO7B-AbDF0zUBu8XvXDrIX6KCy8_Gxgi9zHMdQpHccmPIkCpYywijuueORBeT9v1HJx35JfS0URuXbxDstdax_1nlAqf0NkePhHegJzINEYtZtipfesyocK9DFqbkxSS7iaJ08FYDkuKnl6c830Cj4EqY3CVndWqNwYG0sVzTjSZu0MPtfvyqziDKlXoRbfMDTqQGXWcJ-wU3budKh2AoP-czrWwuVZf7tf3AlA4S7_Cr-Gtdiueqxo"
                alt="Admin" class="w-full h-full object-cover" referrerpolicy="no-referrer" />
            </div>
            <div class="flex flex-col text-left">
              <p class="text-sm font-semibold text-[#0b3e2e]">
                <%= session.getAttribute("admin") !=null ? session.getAttribute("admin") : "Admin" %>
              </p>
              <p class="text-[11px] font-medium text-[#8bb3a3]">Store Manager</p>
            </div>
          </div>

          <form action="logout" method="get" class="m-0 p-0 w-full">
            <button type="submit"
              class="flex items-center justify-center gap-2 py-2.5 rounded-lg text-red-500 hover:bg-red-50 hover:text-red-700 font-medium transition-colors w-full border border-transparent hover:border-red-100">
              <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-4 h-4">
                <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
                <polyline points="16 17 21 12 16 7" />
                <line x1="21" x2="9" y1="12" y2="12" />
              </svg>
              <span class="text-sm">Logout</span>
            </button>
          </form>
        </div>
      </aside>