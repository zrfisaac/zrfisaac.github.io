namespace zrfisaac
{
    partial class MainForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(MainForm));
            sbFooter = new StatusStrip();
            sbBack = new Panel();
            SuspendLayout();
            // 
            // sbFooter
            // 
            sbFooter.ImageScalingSize = new Size(20, 20);
            sbFooter.Location = new Point(0, 131);
            sbFooter.Name = "sbFooter";
            sbFooter.Size = new Size(282, 22);
            sbFooter.TabIndex = 0;
            sbFooter.Text = "statusStrip1";
            // 
            // sbBack
            // 
            sbBack.AutoScroll = true;
            sbBack.BackColor = SystemColors.ControlDarkDark;
            sbBack.Dock = DockStyle.Fill;
            sbBack.Location = new Point(0, 0);
            sbBack.Name = "sbBack";
            sbBack.Size = new Size(282, 131);
            sbBack.TabIndex = 1;
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(282, 153);
            Controls.Add(sbBack);
            Controls.Add(sbFooter);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Name = "MainForm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "MainForm";
            Load += MainForm_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private StatusStrip sbFooter;
        private Panel sbBack;
    }
}
