package net.moremorefor {
	import flash.events.StatusEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.external.ExtensionContext;

	public class HelloWorldExtension extends EventDispatcher {
		private var context:ExtensionContext;

		public function HelloWorldExtension(target:IEventDispatcher=null) {
			super(target);
			context= ExtensionContext.createExtensionContext("net.moremorefor.HelloWorld", "type");
		}

		public function showHelloWorld():void {
			context.call("HelloWorldShowAlert")
		}

		public function dispose():void {
			return context.dispose();
		}

	}
}
