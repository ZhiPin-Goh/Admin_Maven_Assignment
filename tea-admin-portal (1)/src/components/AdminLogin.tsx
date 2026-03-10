import React, { useState } from 'react';
import { Leaf, Lock, User, ArrowRight } from 'lucide-react';

interface AdminLoginProps {
  onLogin: () => void;
}

export function AdminLogin({ onLogin }: AdminLoginProps) {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    
    // Simulate login delay
    setTimeout(() => {
      onLogin();
      setIsLoading(false);
    }, 1000);
  };

  return (
    <div className="min-h-screen w-full flex items-center justify-center bg-[#f5f9f6] relative overflow-hidden">
      {/* Decorative background elements */}
      <div className="absolute top-[-10%] left-[-5%] w-64 h-64 bg-primary/10 rounded-full blur-3xl"></div>
      <div className="absolute bottom-[-10%] right-[-5%] w-96 h-96 bg-primary/5 rounded-full blur-3xl"></div>
      
      <div className="w-full max-w-md px-6 z-10">
        <div className="bg-white rounded-3xl shadow-xl border border-[#cfe7d7] overflow-hidden">
          <div className="bg-deep-oolong p-8 text-center relative">
            <div className="inline-flex items-center justify-center w-16 h-16 bg-primary rounded-2xl mb-4 shadow-lg transform -rotate-6">
              <Leaf className="w-8 h-8 text-green-900" />
            </div>
            <h1 className="text-2xl font-black text-white tracking-tight">Oolong Admin</h1>
            <p className="text-primary/80 text-sm mt-1">Brewing excellence since 2024</p>
            
            {/* Subtle leaf pattern overlay could go here */}
          </div>
          
          <div className="p-8">
            <form onSubmit={handleSubmit} className="space-y-6">
              <div>
                <label className="block text-xs font-bold text-muted-green uppercase tracking-wider mb-2">Username</label>
                <div className="relative">
                  <User className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-green" />
                  <input 
                    type="text" 
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                    placeholder="admin_user"
                    className="w-full pl-10 pr-4 py-3 bg-background-light border border-transparent focus:border-primary focus:ring-1 focus:ring-primary rounded-xl text-sm text-deep-oolong placeholder:text-muted-green outline-none transition-all"
                    required
                  />
                </div>
              </div>
              
              <div>
                <label className="block text-xs font-bold text-muted-green uppercase tracking-wider mb-2">Password</label>
                <div className="relative">
                  <Lock className="absolute left-3 top-1/2 -translate-y-1/2 w-5 h-5 text-muted-green" />
                  <input 
                    type="password" 
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="••••••••"
                    className="w-full pl-10 pr-4 py-3 bg-background-light border border-transparent focus:border-primary focus:ring-1 focus:ring-primary rounded-xl text-sm text-deep-oolong placeholder:text-muted-green outline-none transition-all"
                    required
                  />
                </div>
              </div>
              
              <div className="flex items-center justify-between">
                <label className="flex items-center gap-2 cursor-pointer group">
                  <input type="checkbox" className="w-4 h-4 rounded border-gray-300 text-primary focus:ring-primary" />
                  <span className="text-xs text-muted-green group-hover:text-deep-oolong transition-colors">Remember me</span>
                </label>
                <a href="#" className="text-xs font-bold text-primary hover:text-primary-dark transition-colors">Forgot Password?</a>
              </div>
              
              <button 
                type="submit" 
                disabled={isLoading}
                className="w-full bg-primary hover:bg-primary-dark text-green-900 font-black py-4 rounded-xl shadow-lg shadow-primary/20 flex items-center justify-center gap-2 transition-all transform active:scale-[0.98] disabled:opacity-70"
              >
                {isLoading ? (
                  <div className="w-5 h-5 border-2 border-green-900/30 border-t-green-900 rounded-full animate-spin"></div>
                ) : (
                  <>
                    Sign In
                    <ArrowRight className="w-5 h-5" />
                  </>
                )}
              </button>
            </form>
            
            <div className="mt-8 pt-6 border-t border-gray-100 text-center">
              <p className="text-xs text-muted-green">
                Need help? <a href="#" className="font-bold text-deep-oolong hover:underline">Contact Support</a>
              </p>
            </div>
          </div>
        </div>
        
        <p className="text-center mt-8 text-xs text-muted-green">
          &copy; 2024 Oolong Tea Co. All rights reserved.
        </p>
      </div>
    </div>
  );
}
