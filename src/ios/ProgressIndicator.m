#import <Cordova/CDV.h>
#import "ProgressIndicator.h"
#import "MBProgressHUD.h"

@implementation ProgressIndicator
@synthesize progressIndicator;


/**
 * SIMPLE
 */

- (void)showSimple:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    //UIColor* color = [command.arguments objectAtIndex:1];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeIndeterminate;
	
    self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    
    // Cordova success
	[self returnOkPluginResultForCommand:command];
}



/**
 * SIMPLE with LABEL
 */

- (void)showSimpleWithLabel:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    //UIColor* color = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeIndeterminate;
    self.progressIndicator.label.text = text;
    //self.progressIndicator.color =  [UIColor color:color];
    //HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
    
    self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    
	[self returnOkPluginResultForCommand:command];
    
}



/**
 * SIMPLE with LABEL and DETAIL
 */
- (void)showSimpleWithLabelDetail:(CDVInvokedUrlCommand *)command   {
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    NSString* detail = [command.arguments objectAtIndex:2];
    //UIColor* color = [command.arguments objectAtIndex:3];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeIndeterminate;
    self.progressIndicator.label.text = text;
    self.progressIndicator.detailsLabel.text = detail;
    //self.progressIndicator.color =  [UIColor color:color];
    //HUD.color = [UIColor colorWithRed:0.23 green:0.50 blue:0.82 alpha:0.90];
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
	[self returnOkPluginResultForCommand:command];
}




/**
 * TEXT ONLY
 */

- (void)showText:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    NSString* position = [command.arguments objectAtIndex:2];
    //UIColor* color = [command.arguments objectAtIndex:2];
    
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
	
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
	[self returnOkPluginResultForCommand:command];
    
}




/**
 * DETERMINATE
 */

-(void)showDeterminate:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminate;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 *  DETERMINATE with LABEL
 */

-(void)showDeterminateWithLabel:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminate;
    self.progressIndicator.label.text = text;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE ANNULAR
 */

- (void)showDeterminateAnnular:(CDVInvokedUrlCommand *)command  {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE ANNULAR with LABEL
 */
- (void)showDeterminateAnnularWithLabel:(CDVInvokedUrlCommand *)command  {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeAnnularDeterminate;
    self.progressIndicator.label.text = text;
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE BAR
 */

- (void)showDeterminateBar:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}



/**
 * DETERMINATE BAR with LABEL
 */

- (void)showDeterminateBarWithLabel:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    int increment = [[command.arguments objectAtIndex:1] intValue];
    NSNumber* incrementValue = @(increment);
    NSString* text = [command.arguments objectAtIndex:2];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeDeterminateHorizontalBar;
    self.progressIndicator.label.text = text;
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
    [self.progressIndicator showAnimated:YES];
    
	[self returnOkPluginResultForCommand:command];
}


/**
 * SUCCESS
 */

-(void)showSuccess:(CDVInvokedUrlCommand *)command {
    
    // obtain commands
    bool dim = [[command.arguments objectAtIndex:0] boolValue];
    NSString* text = [command.arguments objectAtIndex:1];
    
    // initialize indicator with options, text, detail
    self.progressIndicator = nil;
    self.progressIndicator = [MBProgressHUD showHUDAddedTo:self.webView.superview animated:YES];
    self.progressIndicator.mode = MBProgressHUDModeCustomView;
    self.progressIndicator.label.text = text;
    
    // custom success image from bundle
    NSString *image = @"ProgressIndicator.bundle/37x-Checkmark.png";
    self.progressIndicator.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    
    
    // Check for dim : true ? false
    if (dim == true) {
        self.progressIndicator.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    }
    
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
	[self returnOkPluginResultForCommand:command];
}

@end
