#import <Cordova/CDV.h>
#import "ProgressIndicator.h"
#import "MBProgressHUD.h"

#define kStyle MBProgressHUDBackgroundStyleSolidColor;
#define kColor [UIColor colorWithWhite:0.0 alpha:0.6];

@implementation ProgressIndicator
@synthesize progressIndicator;


/**
 * SIMPLE
 */

- (void)showSimple:(CDVInvokedUrlCommand *)command {
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeIndeterminate;
	
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = kColor;
	
    // Cordova success
	[self returnOkPluginResultForCommand:command];
}



/**
 * SIMPLE with LABEL
 */

- (void)showSimpleWithLabel:(CDVInvokedUrlCommand *)command {

    NSString* text = [command.arguments objectAtIndex:0];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeIndeterminate;
    self.progressIndicator.label.text = text;
    self.progressIndicator.backgroundView.color =  kColor;
    //HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
    
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = [UIColor colorWithWhite:0.3 alpha:0.3];
    
	[self returnOkPluginResultForCommand:command];
    
}



/**
 * SIMPLE with LABEL and DETAIL
 */
- (void)showSimpleWithLabelDetail:(CDVInvokedUrlCommand *)command   {

    NSString* text = [command.arguments objectAtIndex:0];
    NSString* detail = [command.arguments objectAtIndex:1];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeIndeterminate;
    self.progressIndicator.label.text = text;
    self.progressIndicator.detailsLabel.text = detail;
    self.progressIndicator.backgroundView.color =  kColor;
    //HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];

	self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = [UIColor colorWithWhite:0.3 alpha:0.3];
    
	[self returnOkPluginResultForCommand:command];
}




/**
 * TEXT ONLY
 */

- (void)showText:(CDVInvokedUrlCommand *)command {
	
    NSString* text = [command.arguments objectAtIndex:0];
    NSString* position = [command.arguments objectAtIndex:1];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeText;
    self.progressIndicator.label.text = text;
	self.progressIndicator.margin = 10.f;
    
    
    if ([position isEqualToString:@"top"]) {
        self.progressIndicator.yOffset = -150.f;
    }
    else if ([position isEqualToString:@"bottom"]) {
        self.progressIndicator.yOffset = 200.f;
    }
    else {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
    }
	
	self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = [UIColor colorWithWhite:0.3 alpha:0.3];
    
	[self returnOkPluginResultForCommand:command];
    
}




/**
 * DETERMINATE
 */

-(void)showDeterminate:(CDVInvokedUrlCommand *)command {
	
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminate;
	self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = [UIColor colorWithWhite:0.3 alpha:0.3];
    
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 *  DETERMINATE with LABEL
 */

-(void)showDeterminateWithLabel:(CDVInvokedUrlCommand *)command {

    NSString* text = [command.arguments objectAtIndex:0];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminate;
    self.progressIndicator.label.text = text;
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = [UIColor colorWithWhite:0.3 alpha:0.3];
	
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE ANNULAR
 */

- (void)showDeterminateAnnular:(CDVInvokedUrlCommand *)command  {
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = kColor;
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE ANNULAR with LABEL
 */
- (void)showDeterminateAnnularWithLabel:(CDVInvokedUrlCommand *)command  {
    
    NSString* text = [command.arguments objectAtIndex:0];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    self.progressIndicator.label.text = text;
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = kColor;
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE BAR
 */

- (void)showDeterminateBar:(CDVInvokedUrlCommand *)command {
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = kColor;
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE BAR with LABEL
 */

- (void)showDeterminateBarWithLabel:(CDVInvokedUrlCommand *)command {
    
    NSString* text = [command.arguments objectAtIndex:0];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    self.progressIndicator.label.text = text;
    
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = kColor;
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}


/**
 * SUCCESS
 */

-(void)showSuccess:(CDVInvokedUrlCommand *)command {
    
    NSString* text = [command.arguments objectAtIndex:0];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeCustomView;
    self.progressIndicator.label.text = text;
    
    // custom success image from bundle
    NSString *image = @"ProgressIndicator.bundle/37x-Checkmark.png";
    self.progressIndicator.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    
    self.progressIndicator.backgroundView.style = kStyle;
	self.progressIndicator.backgroundView.color = kColor;
	[self returnOkPluginResultForCommand:command];
}

- (void)setLabelText:(CDVInvokedUrlCommand*)command
{
	// obtain commands
    NSString* text = [command.arguments objectAtIndex:0];
    
    // update indicator with text
    self.progressIndicator.label.text = text;
    
	[self returnOkPluginResultForCommand:command];
}

- (void)setProgress:(CDVInvokedUrlCommand*)command
{
	// obtain commands
    float progress = [[command.arguments objectAtIndex:0] floatValue];

    // update indicator with progress
    self.progressIndicator.progress = progress;
    
	[self returnOkPluginResultForCommand:command];
}

/**
 * HIDE
 */

- (void)hide:(CDVInvokedUrlCommand*)command
{
	if (!self.progressIndicator) {
		CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
		[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
		return;
	}
	[self.progressIndicator hideAnimated:YES];
    self.progressIndicator = nil;

	[self returnOkPluginResultForCommand:command];
}

- (void)returnOkPluginResultForCommand:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
