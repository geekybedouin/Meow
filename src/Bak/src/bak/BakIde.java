/*
 *@Project: Bak IDE Compiler
 *@Author: 'Umar A. Abu Bakr
 *@ID: 11106639
 *@Subject: Compiler Analysis and Design
 *@Lecturer: Dr. Nizar Awartani
*/


package bak;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.ComponentOrientation;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Font;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.text.AttributeSet;
import javax.swing.text.DefaultEditorKit;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyleContext;
import javax.swing.text.StyledDocument;
import javax.swing.JScrollPane;
import javax.swing.JToolBar;
import javax.swing.JButton;
import javax.swing.JTextPane;
import javax.swing.ScrollPaneConstants;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URL;
import java.util.NoSuchElementException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.ImageIcon;
import javax.swing.JDialog;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.text.BadLocationException;
import javax.swing.text.MutableAttributeSet;


class LinuxInteractor {

public static String executeCommand(String command, boolean waitForResponse) {

	String response = "";

	ProcessBuilder pb = new ProcessBuilder("bash", "-c", command);
	pb.redirectErrorStream(true);

	System.out.println("Linux command: " + command);

	try {
		Process shell = pb.start();

		if (waitForResponse) {
			// To capture output from the shell
			InputStream shellIn = shell.getInputStream();

			// Wait for the shell to finish and get the return code
			int shellExitStatus = shell.waitFor();
			System.out.println("Exit status " + shellExitStatus);

			response = convertStreamToStr(shellIn);

			shellIn.close();
		}
	}
	catch (IOException e) {
		System.out.println("Error occured while executing Linux command. Error Description: " + e.getMessage());
	}
	catch (InterruptedException e) {
		System.out.println("Error occured while executing Linux command. Error Description: " + e.getMessage());
    }
    
	return response;
}

/*
* To convert the InputStream to String we use the Reader.read(char[]
* buffer) method. We iterate until the Reader return -1 which means
* there's no more data to read. We use the StringWriter class to
* produce the string.
*/

	public static String convertStreamToStr(InputStream is) throws IOException {
		if (is != null) {
			Writer writer = new StringWriter();

			char[] buffer = new char[1024];
			try {
				Reader reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
				int n;
				while ((n = reader.read(buffer)) != -1) {
					writer.write(buffer, 0, n);
				}
			} finally {
				is.close();
			}
			return writer.toString();
		}
		else {
			return "";
		}
	}
}


public class BakIde extends JFrame implements WindowListener, ActionListener, AttributeSet.FontAttribute{
    
    String nameOfFile;
    JMenuItem Compile = new JMenuItem("Compile");
    JMenuItem Abouty = new JMenuItem("About");
    JMenuItem Exit = new JMenuItem("Exit");
    JMenuItem Open = new JMenuItem("Open");

	public static final Color DEFAULT_KEYWORD_COLOR = Color.blue;

	public static final String[] JAVA_KEYWORDS = new String[] { "#include", "auto","break","case","char","const","continue","default",
"do","double","else","enum","extern","float","for","goto",
"if","int","long","register","return","short","signed",
"sizeof","static","struct","switch","typedef","union",
"unsigned","void","volatile","while" };
	public static String JAVA_KEYWORDS_REGEX;

	static {
		StringBuilder buff = new StringBuilder("");
		buff.append("(");
		for (String keyword : JAVA_KEYWORDS) {
			buff.append("\\b").append(keyword).append("\\b").append("|");
		}
		buff.deleteCharAt(buff.length() - 1);
		buff.append(")");
		JAVA_KEYWORDS_REGEX = buff.toString();
	}

	private JPanel contentPane;
	private JToolBar toolBar;
	private JTextPane textEditor;
	private JScrollPane textEditorScrollPane;
	private StyledDocument textEditorDoc;
        private JTextPane textEditor2;
	private JScrollPane textEditorScrollPane2;
	private StyledDocument textEditorDoc2;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					BakIde frame = new BakIde();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
        
        /*Hii*/
         public static void setJTextPaneFont(JTextPane jtp, Font font, Color c) {
       
        MutableAttributeSet attrs = jtp.getInputAttributes();

        
        StyleConstants.setFontFamily(attrs, font.getFamily());
        StyleConstants.setFontSize(attrs, font.getSize());
        StyleConstants.setItalic(attrs, (font.getStyle() & Font.ITALIC) != 0);
        StyleConstants.setBold(attrs, (font.getStyle() & Font.BOLD) != 0);

       
        StyleConstants.setForeground(attrs, c);

       
        StyledDocument doc = jtp.getStyledDocument();

        
        doc.setCharacterAttributes(0, doc.getLength() + 1, attrs, false);
    }
	/**
         * 
	 * Create the frame.
	 */
	public BakIde() {
		setTitle("Bak Minimal C IDE");
                JMenuBar Bar = new JMenuBar();
                this.addWindowListener(this);
                JMenu File = new JMenu("File");
                try{
                ImageIcon img = new ImageIcon("/bin/favicon.png");
                this.setIconImage(img.getImage());
                }
                catch (Exception e){}
                // iconURL is null when not found
                JMenu Help = new JMenu("Help");
                Help.add(Abouty);
                Abouty.addActionListener(this);
                File.add(Open);
                File.add(Compile);
                Open.setMnemonic('o');
                Compile.setMnemonic('m');
                File.addSeparator();
                
                Exit.addActionListener(this);
                File.add(Exit);
                Compile.addActionListener(this);
                Bar.add(File);
                Bar.add(Help);
                setJMenuBar(Bar);
		setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		setBounds(100, 100, 1000, 500);
                Open.addActionListener(this);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);

		
                textEditor2 = new JTextPane();
                textEditorScrollPane2 = new JScrollPane(textEditor2);
		textEditor = new JTextPane();
                Font font = new Font("Sans_Serif", Font.PLAIN , 16);
                setJTextPaneFont(textEditor, font, Color.BLACK);
		textEditorDoc = textEditor.getStyledDocument();
		textEditor.getDocument().putProperty(
				DefaultEditorKit.EndOfLineStringProperty, "\n");
		textEditorScrollPane = new JScrollPane(textEditor);
		textEditorScrollPane
				.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);
                 textEditor.addKeyListener(new KeyListener(){
                     @Override
                     public void keyTyped(KeyEvent e)
                     {
                         if (e.getKeyChar() == ' ')
                         {
                                clearTextColors();
				Pattern pattern = Pattern.compile(JAVA_KEYWORDS_REGEX);
				System.out.println(pattern.pattern());
				Matcher match = pattern.matcher(textEditor.getText());
				while (match.find()) {
				updateTextColor(match.start(), match.end() - match.start());}
                         }
                     }

                    @Override
                    public void keyPressed(KeyEvent e) {
                       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }

                    @Override
                    public void keyReleased(KeyEvent e) {
                        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
                    }
                 });
		contentPane.add(textEditorScrollPane, BorderLayout.CENTER);
                textEditor2.setPreferredSize(new Dimension (650, 100));
                contentPane.add(textEditorScrollPane2, BorderLayout.SOUTH);
	}

	
	public void updateTextColor(int offset, int length, Color c) {
                Font font = new Font("Sans_Serif",Font.PLAIN, 16);
		StyleContext sc = StyleContext.getDefaultStyleContext();
               
		AttributeSet aset = sc.addAttribute(SimpleAttributeSet.EMPTY,
				StyleConstants.Foreground, c);
                
		textEditorDoc.setCharacterAttributes(offset, length, aset, true);
                textEditor.setFont(font);
	}

	public void clearTextColors() {
		updateTextColor(0, textEditor.getText().length(), Color.BLACK);
	}

	public void updateTextColor(int offset, int length) {
		updateTextColor(offset, length, DEFAULT_KEYWORD_COLOR);
	}

    @Override
    public void windowOpened(WindowEvent e) {
        int value=JOptionPane.showConfirmDialog(null,"Click OK to choose your workspace directory","Choose a Workspace",JOptionPane.OK_CANCEL_OPTION,JOptionPane.WARNING_MESSAGE);
        if (value == JOptionPane.YES_OPTION)
        {
            try{
            JFileChooser choose = new JFileChooser();
            choose.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
            choose.showOpenDialog(choose);
            nameOfFile = choose.getSelectedFile().getAbsolutePath();
            }
            catch (NullPointerException ope)
            {
               String name;
               JOptionPane.showMessageDialog(null, "You didn't choose a directory, Will be using default BakWorkSpace", "Error!!", JOptionPane.OK_OPTION);
               Scanner in;
               try{
                   in = new Scanner(new File("/BakIDE/homepath"));
                    name = in.nextLine();
               }
               catch(Exception z)
               {
                   name = "/home/minus/Music";
               }
               File fle = new File(name + "/BakWorkspace");
               fle.mkdirs();
               nameOfFile = fle.getAbsolutePath();
               
            }
            
            
            
            
        }
        else
        {
            dispose();
        }
    }

    @Override
    public void windowClosing(WindowEvent e) {
          int pick=JOptionPane.showConfirmDialog(null,"Oh, Jim! Do you want to save the file before you exit","Save?",JOptionPane.YES_NO_CANCEL_OPTION,JOptionPane.INFORMATION_MESSAGE);
          if (pick == JOptionPane.YES_OPTION)
          {
              Compile.doClick();
          }
          if (pick == JOptionPane.NO_OPTION)
          {
              dispose();
          }
          if (pick == JOptionPane.CANCEL_OPTION)
          {
              
          }
          if (pick == JOptionPane.CLOSED_OPTION)
          {
              
          }
    }

    @Override
    public void windowClosed(WindowEvent e) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowIconified(WindowEvent e) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowDeiconified(WindowEvent e) {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowActivated(WindowEvent e) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowDeactivated(WindowEvent e) {
      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void actionPerformed(ActionEvent e) {
       if (e.getSource()==Compile)
       {
           
           PrintStream out = null;
           try {
               
               File file = new File(nameOfFile+"/temp.c");
               file.createNewFile();
               File file2 = new File(nameOfFile+"/symbol.txt");
               file2.createNewFile();
               out = new PrintStream(nameOfFile+"/source.cpp");
               System.setOut(out);
               out.println(textEditor.getText());
               System.setOut(System.out);
               
               String par1 = nameOfFile+"/source.cpp";
               String par2 = nameOfFile+"/temp.c";
               String par3 = nameOfFile+"/symbol.txt";
               String[] command = {"/bin/lexical",par1,par2,par3};
                
               Process p = Runtime.getRuntime().exec(command);
                
                //Process p = Runtime.getRuntime().exec("/bin/lexical /home/minus/Music/source.cpp /home/minus/Music/temp.c" );
               p.waitFor();
               
               Scanner x = new Scanner(new File(nameOfFile + "/symbol.txt"));
               StyledDocument doc = textEditor2.getStyledDocument();
               doc.remove(0, doc.getLength());
               SimpleAttributeSet keyWord = new SimpleAttributeSet();
                   StyleConstants.setForeground(keyWord, Color.BLACK);
                   StyleConstants.setBold(keyWord, true);
               while(x.hasNextLine())
               {
                   
                   doc.insertString(doc.getLength(), "\n" + x.nextLine(), null );
                   
                   
               }
               
               //LinuxInteractor.executeCommand("/bin/lexical " + nameOfFile+"/Source.cpp " + nameOfFile+"temp.c", true);
               //System.out.println( "lexical " + nameOfFile+"/Source.cpp " + nameOfFile+"temp.c");
           } catch (FileNotFoundException ex) {
               //Logger.getLogger(JavaHighlighter.class.getName()).log(Level.SEVERE, null, ex);
               System.setOut(System.out);
               out.println("No file found");
           } catch (IOException ex) {
              // Logger.getLogger(JavaHighlighter.class.getName()).log(Level.SEVERE, null, ex);
           } catch (InterruptedException ex) {
               //Logger.getLogger(JavaHighlighter.class.getName()).log(Level.SEVERE, null, ex);
           } catch (BadLocationException ex) {
               //Logger.getLogger(BakIde.class.getName()).log(Level.SEVERE, null, ex);
           }
           catch (NoSuchElementException ex){
               
           }
           
           
           
           
          
              
           
           
       }
       if(e.getSource()==Abouty)
           {
               String s = "A free-software minimized educational IDE developed by: 'Umar A.Abu Baker - An-Najah National University / Computer Science Department - 2014. Offers an minimized interface implemented in JAVA programming language based on the \"Khwarizmi Baby C Compiler\" - (kbcc) which is implemented in \"x86/GAS Syntax Assembly\". The compiler aims to transfer c code into a target machine code/executable program, with a report showing the details of each compiler phase. compatible with GNU/Linux x86 machines. ";
               String html1 = "<html><body style='width: 400 px'>";
               
               JOptionPane.showMessageDialog(null,new JLabel(html1+s),"About The Bak IDE",JOptionPane.INFORMATION_MESSAGE);
           }
       if (e.getSource()==Exit)
       {
             
           dispose();
       }
       if(e.getSource()==Open)
       {
           
           String path;
           JFileChooser open = new JFileChooser();
           try{
           open.showOpenDialog(this);
           FileNameExtensionFilter cppfilter = new FileNameExtensionFilter("cpp files (*.cpp)", "cpp");
            open.setFileFilter(cppfilter);
            open.setDialogTitle("Open a Cpp file into prespective");
 // set selected filter
            open.setFileFilter(cppfilter);
            path=open.getSelectedFile().getAbsolutePath();
           }
           
           catch (NullPointerException exc)
           {
               JOptionPane.showMessageDialog(null, "Jim, The file you've chosen isn't a cpp file  ", "Error",JOptionPane.OK_OPTION);
               path=null;
           }
            
            
            if (path==null)
            {
                return;
            }
           
            Scanner in;
           try {
               in = new Scanner(new File(path));
           } catch (FileNotFoundException ex) {
               return ;
        }
           
           
            
            while (in.hasNextLine())
            {
                try
                {
                        
                  textEditorDoc.insertString(textEditorDoc.getLength(), in.nextLine(), null );
                  
                }
                catch(Exception Z)
                {
                    
                }
            }
    }
    }
}