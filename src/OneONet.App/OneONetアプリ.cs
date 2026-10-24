using Microsoft.UI.Xaml;

namespace OneONet.App;

// 前提: XAML は App.xaml のリソースの辞書だけに使う(csharp_coding_rules.md 第9条)。画面の部品の木はここで組み立てて OneONet.UI から受け取る
public sealed partial class OneONetアプリ : Application
{
    private Window? 主画面;

    public OneONetアプリ()
    {
        InitializeComponent();
    }

    protected override void OnLaunched(LaunchActivatedEventArgs args)
    {
        主画面 = new Window { Title = "OneOnet" };
        主画面.Activate();
    }
}
