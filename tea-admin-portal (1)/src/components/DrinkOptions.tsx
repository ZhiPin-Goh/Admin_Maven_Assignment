import React, { useState } from 'react';
import { Plus, Trash2, Edit2, Check, X, Thermometer, Droplets, Maximize } from 'lucide-react';

interface Option {
  id: string;
  name: string;
  value: string;
}

interface Category {
  id: string;
  title: string;
  icon: React.ElementType;
  options: Option[];
}

export function DrinkOptions() {
  const [categories, setCategories] = useState<Category[]>([
    {
      id: 'ice',
      title: 'Ice Level',
      icon: Thermometer,
      options: [
        { id: 'i1', name: 'No Ice', value: '0%' },
        { id: 'i2', name: 'Less Ice', value: '25%' },
        { id: 'i3', name: 'Normal Ice', value: '50%' },
        { id: 'i4', name: 'Extra Ice', value: '100%' },
      ]
    },
    {
      id: 'sugar',
      title: 'Sugar Level',
      icon: Droplets,
      options: [
        { id: 's1', name: 'No Sugar', value: '0%' },
        { id: 's2', name: 'Quarter Sugar', value: '25%' },
        { id: 's3', name: 'Half Sugar', value: '50%' },
        { id: 's4', name: 'Less Sugar', value: '75%' },
        { id: 's5', name: 'Normal Sugar', value: '100%' },
      ]
    },
    {
      id: 'size',
      title: 'Cup Size',
      icon: Maximize,
      options: [
        { id: 'z1', name: 'Small', value: '350ml' },
        { id: 'z2', name: 'Medium', value: '500ml' },
        { id: 'z3', name: 'Large', value: '700ml' },
      ]
    }
  ]);

  const [editingId, setEditingId] = useState<string | null>(null);
  const [editName, setEditName] = useState('');
  const [editValue, setEditValue] = useState('');

  const handleAdd = (categoryId: string) => {
    const newOption: Option = {
      id: Math.random().toString(36).substr(2, 9),
      name: 'New Option',
      value: '0%'
    };
    setCategories(categories.map(cat => 
      cat.id === categoryId 
        ? { ...cat, options: [...cat.options, newOption] }
        : cat
    ));
    setEditingId(newOption.id);
    setEditName(newOption.name);
    setEditValue(newOption.value);
  };

  const handleDelete = (categoryId: string, optionId: string) => {
    setCategories(categories.map(cat => 
      cat.id === categoryId 
        ? { ...cat, options: cat.options.filter(opt => opt.id !== optionId) }
        : cat
    ));
  };

  const startEdit = (option: Option) => {
    setEditingId(option.id);
    setEditName(option.name);
    setEditValue(option.value);
  };

  const saveEdit = (categoryId: string) => {
    setCategories(categories.map(cat => 
      cat.id === categoryId 
        ? { 
            ...cat, 
            options: cat.options.map(opt => 
              opt.id === editingId 
                ? { ...opt, name: editName, value: editValue }
                : opt
            ) 
          }
        : cat
    ));
    setEditingId(null);
  };

  return (
    <div className="flex-1 flex flex-col h-full overflow-hidden bg-background-light">
      <header className="px-8 py-6 shrink-0">
        <div className="max-w-[1400px] mx-auto">
          <h2 className="text-3xl font-black text-deep-oolong tracking-tight">Drink Options</h2>
          <p className="text-muted-green text-sm mt-1">Configure customization levels for your beverages.</p>
        </div>
      </header>

      <div className="flex-1 overflow-y-auto px-8 pb-8">
        <div className="max-w-[1400px] mx-auto grid grid-cols-1 lg:grid-cols-3 gap-8">
          {categories.map((category) => (
            <div key={category.id} className="bg-white rounded-2xl border border-[#cfe7d7] shadow-sm overflow-hidden flex flex-col h-fit">
              <div className="p-6 border-b border-[#cfe7d7] flex items-center justify-between bg-background-light/50">
                <div className="flex items-center gap-3">
                  <div className="p-2 bg-primary/20 rounded-lg">
                    <category.icon className="w-5 h-5 text-green-800" />
                  </div>
                  <h3 className="font-bold text-deep-oolong">{category.title}</h3>
                </div>
                <button 
                  onClick={() => handleAdd(category.id)}
                  className="p-1.5 hover:bg-primary/20 rounded-lg transition-colors text-primary-dark"
                >
                  <Plus className="w-5 h-5" />
                </button>
              </div>

              <div className="p-4 space-y-3">
                {category.options.map((option) => (
                  <div 
                    key={option.id} 
                    className={`group flex items-center justify-between p-3 rounded-xl border transition-all ${
                      editingId === option.id 
                        ? 'border-primary bg-primary/5 ring-1 ring-primary' 
                        : 'border-gray-100 bg-white hover:border-primary/30 hover:shadow-sm'
                    }`}
                  >
                    {editingId === option.id ? (
                      <div className="flex-1 flex items-center gap-2 mr-2">
                        <input 
                          type="text" 
                          value={editName}
                          onChange={(e) => setEditName(e.target.value)}
                          className="flex-1 min-w-0 bg-white border border-gray-200 rounded-md px-2 py-1 text-sm outline-none focus:border-primary"
                          placeholder="Name"
                        />
                        <input 
                          type="text" 
                          value={editValue}
                          onChange={(e) => setEditValue(e.target.value)}
                          className="w-20 bg-white border border-gray-200 rounded-md px-2 py-1 text-sm outline-none focus:border-primary"
                          placeholder="Value"
                        />
                      </div>
                    ) : (
                      <div className="flex-1 flex items-center justify-between mr-4">
                        <span className="text-sm font-bold text-deep-oolong">{option.name}</span>
                        <span className="text-xs font-medium text-muted-green bg-background-light px-2 py-0.5 rounded-full">{option.value}</span>
                      </div>
                    )}

                    <div className="flex items-center gap-1 shrink-0">
                      {editingId === option.id ? (
                        <>
                          <button 
                            onClick={() => saveEdit(category.id)}
                            className="p-1.5 text-green-600 hover:bg-green-50 rounded-md transition-colors"
                          >
                            <Check className="w-4 h-4" />
                          </button>
                          <button 
                            onClick={() => setEditingId(null)}
                            className="p-1.5 text-gray-400 hover:bg-gray-50 rounded-md transition-colors"
                          >
                            <X className="w-4 h-4" />
                          </button>
                        </>
                      ) : (
                        <>
                          <button 
                            onClick={() => startEdit(option)}
                            className="p-1.5 text-gray-400 hover:text-primary hover:bg-primary/10 rounded-md transition-colors opacity-0 group-hover:opacity-100"
                          >
                            <Edit2 className="w-4 h-4" />
                          </button>
                          <button 
                            onClick={() => handleDelete(category.id, option.id)}
                            className="p-1.5 text-gray-400 hover:text-red-500 hover:bg-red-50 rounded-md transition-colors opacity-0 group-hover:opacity-100"
                          >
                            <Trash2 className="w-4 h-4" />
                          </button>
                        </>
                      )}
                    </div>
                  </div>
                ))}

                {category.options.length === 0 && (
                  <div className="text-center py-8">
                    <p className="text-xs text-muted-green italic">No options defined.</p>
                  </div>
                )}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
