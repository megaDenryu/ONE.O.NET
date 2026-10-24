using Microsoft.UI.Dispatching;
using Microsoft.UI.Xaml;

namespace OneONet.App;

internal static class Program
{
    [STAThread]
    private static void Main()
    {
        WinRT.ComWrappersSupport.InitializeComWrappers();
        Application.Start(起動情報 =>
        {
            SynchronizationContext.SetSynchronizationContext(new DispatcherQueueSynchronizationContext(DispatcherQueue.GetForCurrentThread()));
            _ = new OneONetアプリ();
        });
    }
}
