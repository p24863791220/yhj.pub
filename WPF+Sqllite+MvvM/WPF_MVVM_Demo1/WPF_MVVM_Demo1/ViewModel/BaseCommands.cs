using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace WPF_MVVM_Demo1.ViewModel
{
    public class BaseCommands:ICommand
    {
        public Action<object> ExecuteCommand = null;

        public Func<object, bool> CanExecuteCommand = null;

        //当命令可执行状态发生改变时，应当被激发
        public event EventHandler CanExecuteChanged;

        

        //用于判断命令是否可以执行
        public bool CanExecute(object parameter)
        {
            if (CanExecuteCommand != null)
            {
                return this.CanExecuteCommand(parameter);
            }
            else
            {
                return true;
            }
        }
        //命令执行
        public void Execute(object parameter)
        {
            if (this.ExecuteCommand != null) this.ExecuteCommand(parameter);
        }
    }

    public class BaseCommands<T> : ICommand
    {
        readonly Action<object> _execute;
        readonly Predicate<object> _canExecute;

        public BaseCommands(Action<object> execute)
            : this(execute, null)
        {
        }

        public BaseCommands(Action<object> execute, Predicate<object> canExecute)
        {
            if (execute == null)
                throw new ArgumentNullException("execute");

            _execute = execute;
            _canExecute = canExecute;
        }

        public bool CanExecute(object parameter)
        {
            return _canExecute == null || _canExecute(parameter);
        }

        public event EventHandler CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }

        public void Execute(object parameter)
        {
            _execute(parameter);
        }

    }
}
