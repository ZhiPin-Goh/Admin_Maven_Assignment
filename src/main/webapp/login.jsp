<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="java.time.Year" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="header.jsp"/>
</head>
<body>
    <div class="min-h-screen w-full flex items-center justify-center bg-[#f5f9f6] relative overflow-hidden">
      <!-- Decorative background elements -->
      <div class="absolute top-[-10%] left-[-5%] w-64 h-64 bg-[#13ec5b]/10 rounded-full blur-3xl"></div>
      <div class="absolute bottom-[-10%] right-[-5%] w-96 h-96 bg-[#13ec5b]/5 rounded-full blur-3xl"></div>

      <div class="w-full max-w-md px-6 z-10">
        <div class="bg-white rounded-3xl shadow-xl border border-[#cfe7d7] overflow-hidden">
          <div class="bg-[#0d1b12] p-8 text-center relative">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-[#13ec5b] rounded-2xl mb-4 shadow-lg transform -rotate-6">
              <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-8 h-8 text-green-900"><path d="M11 20A7 7 0 0 1 9.8 6.1C15.5 5 17 4.48 19 2c1 2 2 4.18 2 8 0 5.5-4.78 10-10 10Z"/><path d="M2 21c0-3 1.85-5.36 5.08-6C9.5 14.52 12 13 13 12"/></svg>
            </div>
            <h1 class="text-2xl font-black text-white tracking-tight">Welcome Back</h1>
            <p class="text-[#13ec5b]/80 text-sm mt-1">Brewing excellence since 2024</p>
          </div>

          <div class="p-8">
            <c:if test="${not empty errorMessage}">
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-4" role="alert">
                    <span class="block sm:inline">${errorMessage}</span>
                </div>
            </c:if>

            <form action="login" method="get" class="space-y-6">
              <div>
                <label for="name" class="block text-xs font-bold text-[#4c9a66] uppercase tracking-wider mb-2">Username</label>
                <div class="relative">
                  <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#4c9a66]"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                  <input
                    type="text"
                    id="name"
                    name="name"
                    placeholder="admin_user"
                    class="w-full pl-10 pr-4 py-3 bg-[#f6f8f6] border border-transparent focus:border-[#13ec5b] focus:ring-1 focus:ring-[#13ec5b] rounded-xl text-sm text-[#0d1b12] placeholder:text-[#4c9a66] outline-none transition-all"
                    required
                  />
                </div>
              </div>

              <div>
                <label for="password" class="block text-xs font-bold text-[#4c9a66] uppercase tracking-wider mb-2">Password</label>
                <div class="relative">
                  <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-[#4c9a66]"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                  <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="••••••••"
                    class="w-full pl-10 pr-4 py-3 bg-[#f6f8f6] border border-transparent focus:border-[#13ec5b] focus:ring-1 focus:ring-[#13ec5b] rounded-xl text-sm text-[#0d1b12] placeholder:text-[#4c9a66] outline-none transition-all"
                    required
                  />
                </div>
              </div>


              <button
                type="submit"
                class="w-full bg-[#13ec5b] hover:bg-[#0eb545] text-green-900 font-black py-4 rounded-xl shadow-lg shadow-[#13ec5b]/20 flex items-center justify-center gap-2 transition-all transform active:scale-[0.98] disabled:opacity-70"
              >
                  Sign In
                  <svg xmlns="http://www.w3.org/2001/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-5 h-5"><path d="M5 12h14"/><path d="m12 5 7 7-7 7"/></svg>
              </button>
            </form>

            <div class="mt-8 pt-6 border-t border-gray-100 text-center">
              <p class="text-xs text-[#4c9a66]">
                Need help? <a href="#" class="font-bold text-[#0d1b12] hover:underline">Contact Support</a>
              </p>
            </div>
          </div>
        </div>

        <p class="text-center mt-8 text-xs text-[#4c9a66]">
          &copy; <%= Year.now().getValue() %>
          Zen Tea. All right reserved.
        </p>
      </div>
    </div>
</body>
</html>