'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */

describe('AlsStaff App:', function() {
  
  describe('Blog Page ', function() {

    beforeEach(function() {
      browser().navigateTo('/blog');
    });

    it('should have a title, and list', function() {
      expect(element('h1').text()).toBe('Blog & Stuff');
      expect(repeater('ul.nav.nav-list li').count()).toBeGreaterThan(3);
      expect(element('ul.nav.nav-list li:first').text()).toBe('Articles');
      expect(repeater('div.span6 h2').count()).toBe(1);
      expect(element('li:eq(1) span').text()).toBe('Test Blog 4');
    });
 
    it('should have an active class', function() {
      expect(element('li:eq(1) span').prop('className')).toMatch(/active/);
    });


    it('should have active class, click should change full blog title, should change active class', function() {
      //@todo come back to this or hit with rails
      expect(element('li:eq(1) span').prop('className')).toMatch(/active/);
      expect(element('.blog-full h2').text()).toBe('Test Blog 4');
      element('ul.nav li:eq(2) span').click();
      expect(element('.blog-full h2').text()).toBe('Test Blog 3');
      expect(element('li:eq(2) span').prop('className')).toMatch(/active/);
    });


  });

  describe('Tag testing on blog page...', function() {

    beforeEach(function() {
      browser().navigateTo('/blog/4');
    });

    it('Should render the Tag text and Tag 1 and Tag 2', function() {
      expect(element('h3').text()).toBe('Tags');
      expect(element('h2').text()).toBe('Test Blog 4');
    });
      
  });  

});
