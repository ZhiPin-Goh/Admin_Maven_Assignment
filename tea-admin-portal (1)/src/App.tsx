/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import { useState } from 'react';
import { Sidebar } from './components/Sidebar';
import { Dashboard } from './components/Dashboard';
import { Orders } from './components/Orders';
import { MenuManagement } from './components/MenuManagement';
import { Customers } from './components/Customers';
import { AdminLogin } from './components/AdminLogin';
import { DrinkOptions } from './components/DrinkOptions';

export default function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [activeTab, setActiveTab] = useState('orders');

  if (!isAuthenticated) {
    return <AdminLogin onLogin={() => setIsAuthenticated(true)} />;
  }

  return (
    <div className="flex h-screen w-full bg-background-light overflow-hidden">
      <Sidebar activeTab={activeTab} setActiveTab={setActiveTab} onLogout={() => setIsAuthenticated(false)} />
      
      {activeTab === 'dashboard' && <Dashboard />}
      {activeTab === 'orders' && <Orders />}
      {activeTab === 'menu' && <MenuManagement />}
      {activeTab === 'options' && <DrinkOptions />}
      {activeTab === 'customers' && <Customers />}
      {activeTab === 'settings' && (
        <div className="flex-1 flex items-center justify-center">
          <p className="text-gray-500">Settings coming soon...</p>
        </div>
      )}
    </div>
  );
}
