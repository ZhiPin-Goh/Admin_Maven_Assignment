import { LayoutDashboard, ShoppingBag, Utensils, Users, LogOut, Settings2 } from 'lucide-react';

export function Sidebar({ activeTab, setActiveTab, onLogout }: { activeTab: string, setActiveTab: (tab: string) => void, onLogout: () => void }) {
  const navItems = [
    { id: 'dashboard', label: 'Dashboard', icon: LayoutDashboard },
    { id: 'orders', label: 'Orders', icon: ShoppingBag },
    { id: 'menu', label: 'Menu Management', icon: Utensils },
    { id: 'options', label: 'Drink Options', icon: Settings2 },
    { id: 'customers', label: 'Customers', icon: Users },
  ];

  return (
    <aside className="w-64 bg-white h-full flex flex-col border-r border-[#cfe7d7] shrink-0">
      <div className="p-6 pb-2">
        <div className="flex flex-col">
          <h1 className="text-deep-oolong text-xl font-bold leading-normal tracking-tight">Tea Admin</h1>
          <p className="text-muted-green text-xs font-medium uppercase tracking-wider mt-1">Management Portal</p>
        </div>
      </div>
      <nav className="flex-1 px-4 py-4 flex flex-col gap-2 overflow-y-auto">
        {navItems.map((item) => {
          const isActive = activeTab === item.id;
          const Icon = item.icon;
          return (
            <button
              key={item.id}
              onClick={() => setActiveTab(item.id)}
              className={`flex items-center gap-3 px-3 py-3 rounded-lg transition-colors group ${
                isActive 
                  ? 'bg-primary/20 text-green-900 font-bold' 
                  : 'hover:bg-background-light text-gray-600 font-medium'
              }`}
            >
              <Icon className={`w-5 h-5 ${isActive ? 'text-green-800' : 'text-gray-500 group-hover:text-deep-oolong'}`} />
              <span className={isActive ? 'text-green-900' : 'group-hover:text-deep-oolong'}>{item.label}</span>
            </button>
          );
        })}
      </nav>
      <div className="p-4 border-t border-[#cfe7d7] flex flex-col gap-4">
        <div className="flex items-center gap-3 px-3 py-2 rounded-lg bg-background-light">
          <div className="h-8 w-8 rounded-full bg-gradient-to-tr from-primary to-green-200 overflow-hidden relative">
            <img 
              src="https://lh3.googleusercontent.com/aida-public/AB6AXuCULtVoMytBAzWa69q5FeQOLO7B-AbDF0zUBu8XvXDrIX6KCy8_Gxgi9zHMdQpHccmPIkCpYywijuueORBeT9v1HJx35JfS0URuXbxDstdax_1nlAqf0NkePhHegJzINEYtZtipfesyocK9DFqbkxSS7iaJ08FYDkuKnl6c830Cj4EqY3CVndWqNwYG0sVzTjSZu0MPtfvyqziDKlXoRbfMDTqQGXWcJ-wU3budKh2AoP-czrWwuVZf7tf3AlA4S7_Cr-Gtdiueqxo" 
              alt="Admin" 
              className="w-full h-full object-cover"
              referrerPolicy="no-referrer"
            />
          </div>
          <div className="flex flex-col text-left">
            <p className="text-sm font-semibold text-deep-oolong">Jane Admin</p>
            <p className="text-xs text-muted-green">Store Manager</p>
          </div>
        </div>
        
        <button 
          onClick={onLogout}
          className="flex items-center gap-3 px-3 py-2 rounded-lg text-red-600 hover:bg-red-50 font-medium transition-colors w-full"
        >
          <LogOut className="w-5 h-5" />
          <span>Logout</span>
        </button>
      </div>
    </aside>
  );
}
