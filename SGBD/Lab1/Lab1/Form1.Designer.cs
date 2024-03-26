namespace Lab1
{
    partial class Form1
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
            dataGridView1 = new DataGridView();
            buttonFirst = new Button();
            buttonPrev = new Button();
            buttonNext = new Button();
            buttonLast = new Button();
            labelRecord = new Label();
            dataGridChildView = new DataGridView();
            labelName = new Label();
            labelPlatform = new Label();
            textBoxName = new TextBox();
            textBoxPlatform = new TextBox();
            buttonAdd = new Button();
            buttonDelete = new Button();
            buttonUpdate = new Button();
            backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            textBoxPrice = new TextBox();
            labelPrice = new Label();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            ((System.ComponentModel.ISupportInitialize)dataGridChildView).BeginInit();
            SuspendLayout();
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(29, 92);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.Size = new Size(322, 209);
            dataGridView1.TabIndex = 0;
            dataGridView1.CellClick += dataGridView1_CellClick;
            // 
            // buttonFirst
            // 
            buttonFirst.Location = new Point(29, 333);
            buttonFirst.Name = "buttonFirst";
            buttonFirst.Size = new Size(75, 23);
            buttonFirst.TabIndex = 1;
            buttonFirst.Text = "First";
            buttonFirst.UseVisualStyleBackColor = true;
            buttonFirst.Click += buttonFirst_Click;
            // 
            // buttonPrev
            // 
            buttonPrev.Location = new Point(134, 333);
            buttonPrev.Name = "buttonPrev";
            buttonPrev.Size = new Size(75, 23);
            buttonPrev.TabIndex = 2;
            buttonPrev.Text = "Prev";
            buttonPrev.UseVisualStyleBackColor = true;
            buttonPrev.Click += buttonPrev_Click;
            // 
            // buttonNext
            // 
            buttonNext.Location = new Point(29, 385);
            buttonNext.Name = "buttonNext";
            buttonNext.Size = new Size(75, 23);
            buttonNext.TabIndex = 3;
            buttonNext.Text = "Next";
            buttonNext.UseVisualStyleBackColor = true;
            buttonNext.Click += buttonNext_Click;
            // 
            // buttonLast
            // 
            buttonLast.Location = new Point(134, 385);
            buttonLast.Name = "buttonLast";
            buttonLast.Size = new Size(75, 23);
            buttonLast.TabIndex = 4;
            buttonLast.Text = "Last";
            buttonLast.UseVisualStyleBackColor = true;
            buttonLast.Click += buttonLast_Click;
            // 
            // labelRecord
            // 
            labelRecord.AutoSize = true;
            labelRecord.Location = new Point(29, 59);
            labelRecord.Name = "labelRecord";
            labelRecord.Size = new Size(44, 15);
            labelRecord.TabIndex = 5;
            labelRecord.Text = "Record";
            // 
            // dataGridChildView
            // 
            dataGridChildView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridChildView.Location = new Point(434, 92);
            dataGridChildView.Name = "dataGridChildView";
            dataGridChildView.Size = new Size(322, 209);
            dataGridChildView.TabIndex = 6;
            dataGridChildView.CellClick += dataGridChildView_CellClick;
            // 
            // labelName
            // 
            labelName.AutoSize = true;
            labelName.Location = new Point(456, 316);
            labelName.Name = "labelName";
            labelName.Size = new Size(39, 15);
            labelName.TabIndex = 7;
            labelName.Text = "Name";
            // 
            // labelPlatform
            // 
            labelPlatform.AutoSize = true;
            labelPlatform.Location = new Point(570, 315);
            labelPlatform.Name = "labelPlatform";
            labelPlatform.Size = new Size(53, 15);
            labelPlatform.TabIndex = 8;
            labelPlatform.Text = "Platform";
            // 
            // textBoxName
            // 
            textBoxName.Location = new Point(434, 334);
            textBoxName.Name = "textBoxName";
            textBoxName.Size = new Size(100, 23);
            textBoxName.TabIndex = 9;
            // 
            // textBoxPlatform
            // 
            textBoxPlatform.Location = new Point(552, 333);
            textBoxPlatform.Name = "textBoxPlatform";
            textBoxPlatform.Size = new Size(100, 23);
            textBoxPlatform.TabIndex = 10;
            // 
            // buttonAdd
            // 
            buttonAdd.Location = new Point(434, 405);
            buttonAdd.Name = "buttonAdd";
            buttonAdd.Size = new Size(75, 23);
            buttonAdd.TabIndex = 11;
            buttonAdd.Text = "Add";
            buttonAdd.UseVisualStyleBackColor = true;
            buttonAdd.Click += buttonAdd_Click;
            // 
            // buttonDelete
            // 
            buttonDelete.Location = new Point(552, 405);
            buttonDelete.Name = "buttonDelete";
            buttonDelete.Size = new Size(75, 23);
            buttonDelete.TabIndex = 12;
            buttonDelete.Text = "Delete";
            buttonDelete.UseVisualStyleBackColor = true;
            buttonDelete.Click += buttonDelete_Click;
            // 
            // buttonUpdate
            // 
            buttonUpdate.Location = new Point(667, 405);
            buttonUpdate.Name = "buttonUpdate";
            buttonUpdate.Size = new Size(75, 23);
            buttonUpdate.TabIndex = 13;
            buttonUpdate.Text = "Update";
            buttonUpdate.UseVisualStyleBackColor = true;
            buttonUpdate.Click += buttonUpdate_Click;
            // 
            // textBoxPrice
            // 
            textBoxPrice.Location = new Point(679, 333);
            textBoxPrice.Name = "textBoxPrice";
            textBoxPrice.Size = new Size(100, 23);
            textBoxPrice.TabIndex = 14;
            // 
            // labelPrice
            // 
            labelPrice.AutoSize = true;
            labelPrice.Location = new Point(704, 315);
            labelPrice.Name = "labelPrice";
            labelPrice.Size = new Size(33, 15);
            labelPrice.TabIndex = 16;
            labelPrice.Text = "Price";
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(800, 450);
            Controls.Add(labelPrice);
            Controls.Add(textBoxPrice);
            Controls.Add(buttonUpdate);
            Controls.Add(buttonDelete);
            Controls.Add(buttonAdd);
            Controls.Add(textBoxPlatform);
            Controls.Add(textBoxName);
            Controls.Add(labelPlatform);
            Controls.Add(labelName);
            Controls.Add(dataGridChildView);
            Controls.Add(labelRecord);
            Controls.Add(buttonLast);
            Controls.Add(buttonNext);
            Controls.Add(buttonPrev);
            Controls.Add(buttonFirst);
            Controls.Add(dataGridView1);
            Name = "Form1";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ((System.ComponentModel.ISupportInitialize)dataGridChildView).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView dataGridView1;
        private Button buttonFirst;
        private Button buttonPrev;
        private Button buttonNext;
        private Button buttonLast;
        private Label labelRecord;
        private DataGridView dataGridChildView;
        private Label labelName;
        private Label labelPlatform;
        private TextBox textBoxName;
        private TextBox textBoxPlatform;
        private Button buttonAdd;
        private Button buttonDelete;
        private Button buttonUpdate;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private TextBox textBoxPrice;
        private Label labelPrice;
    }
}
