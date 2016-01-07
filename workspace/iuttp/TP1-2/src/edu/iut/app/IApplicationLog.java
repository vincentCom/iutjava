package edu.iut.app;

public interface IApplicationLog {
	void setMessage(String message);
	public String getMessage();
	public void addListener(IApplicationLogListener listener);
	public IApplicationLogListener[] getpplicationLogListeners(); 

	
	
}
