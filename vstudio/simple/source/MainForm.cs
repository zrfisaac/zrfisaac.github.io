using System.Reflection;

namespace zrfisaac
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            // # : - title
            this.Text = ((AssemblyTitleAttribute)Attribute.GetCustomAttribute(
                Assembly.GetExecutingAssembly(),
                typeof(AssemblyTitleAttribute),
                false
            )).Title;
        }
    }
}
