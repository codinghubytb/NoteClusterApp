using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using NoteClusterWebApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NoteClusterWebApp.Components.PageModels
{
    public class BasePageModel : ComponentBase
    {
        [Inject]
        public ClusterDatabase ClusterDatabase { get; set; } = new ClusterDatabase();

        [Inject]
        public NavigationManager NavigationManager { get; set; }

        [Inject]
        public IJSRuntime JSRuntime { get; set; }

        [CascadingParameter]
        public Action<string> UpdateTitle { get; set; }

        public bool IsSnackToast { get; set; }
        public string TextSnackToast { get; set; }
        public string StatusSnackToast { get; set; }

        public async void OnSnackToast(string text, string status)
        {
            StatusSnackToast = status;
            TextSnackToast = text;
            IsSnackToast = true;
            StateHasChanged();
            await Task.Delay(3000);
            IsSnackToast = false;
            TextSnackToast = string.Empty;
            StatusSnackToast = string.Empty;
            StateHasChanged();
        }

        protected void OnNavigate(string path)
        {
            NavigationManager.NavigateTo(path);
        }
    }
}
