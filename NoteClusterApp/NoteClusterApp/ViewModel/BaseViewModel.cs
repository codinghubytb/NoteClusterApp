using NoteClusterApp.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using CommunityToolkit;
using CommunityToolkit.Mvvm.ComponentModel;

namespace NoteClusterApp.ViewModel
{
    public partial class BaseViewModel : ObservableObject
    {
        [ObservableProperty]
        Database database;

        [ObservableProperty]
        bool isRefresh = false;

        [ObservableProperty]
        bool isReadOnly = false;

        [ObservableProperty]
        bool isDelete = false;

        [ObservableProperty]
        [NotifyPropertyChangedFor(nameof(IsNotBusy))]
        bool isBusy = false;

        [ObservableProperty]
        string title = string.Empty;

        public bool IsNotBusy => !IsBusy;
        public BaseViewModel()
        {
            Database = new Database();
        }
    }
}
