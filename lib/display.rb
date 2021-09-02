module Display
  hangman = [
    "\t\t\t\t-------
    \t\t\t\t|     |
    \t\t\t\t|     
    \t\t\t\t|    
    \t\t\t\t|    
    \t\t\t\t|    
    \t\t\t\t|
    \t\t\t\t|
    \t\t\t    -----------------\n\n",
    "\t\t\t\t-------
    \t\t\t\t|     |
    \t\t\t\t|     \e[37m\u25CF\e[0m
    \t\t\t\t|    
    \t\t\t\t|    
    \t\t\t\t|    
    \t\t\t\t|
    \t\t\t\t|
    \t\t\t    -----------------\n\n",
    "\t\t\t\t-------
    \t\t\t\t|     |
    \t\t\t\t|     \e[37m\u25CF\e[0m
    \t\t\t\t|    /
    \t\t\t\t|    
    \t\t\t\t|    
    \t\t\t\t|
    \t\t\t\t|
    \t\t\t    -----------------\n\n",
    "\t\t\t\t-------
    \t\t\t\t|     |
    \t\t\t\t|     \e[37m\u25CF\e[0m
    \t\t\t\t|    /|\\
    \t\t\t\t|    
    \t\t\t\t|    
    \t\t\t\t|
    \t\t\t\t|
    \t\t\t    -----------------\n\n",
    "\t\t\t\t-------
    \t\t\t\t|     |
    \t\t\t\t|     \e[37m\u25CF\e[0m
    \t\t\t\t|    /|\\
    \t\t\t\t|     |
    \t\t\t\t|    
    \t\t\t\t|
    \t\t\t\t|
    \t\t\t    -----------------\n\n",
    "\t\t\t\t-------
    \t\t\t\t|     |
    \t\t\t\t|     \e[37m\u25CF\e[0m
    \t\t\t\t|    /|\\
    \t\t\t\t|     |
    \t\t\t\t|    / 
    \t\t\t\t|
    \t\t\t\t|
    \t\t\t    -----------------\n\n",              
    "\t\t\t\t-------
    \t\t\t\t|     |
    \t\t\t\t|     \e[37m\u25CF\e[0m
    \t\t\t\t|    /|\\
    \t\t\t\t|     |
    \t\t\t\t|    / \\
    \t\t\t\t|
    \t\t\t\t|
    \t\t\t    -----------------\n\n"
  ]

  def show_hangman(fails)
    puts hangman[fails]
  end
end
