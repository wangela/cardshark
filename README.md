# CardShark

Pick the right credit card every time at checkout for maximum rewards.

Love cash back or frequent flyer miles? With bonus categories changing every quarter, it's impossible to keep the varying reward levels straight in your head. CardShark tells you which card in your wallet will give you the most rewards at the merchant you're visiting.

CardShark prioritizes your privacy and does not store your credit card number.

## Features

### Wallet and Adding Cards

- [x] User sees a list of the cards they own in their wallet view
- [x] User can tap a card in wallet to see its details
- [ ] User can add a card by visually scanning the card's front art with their phone camera
- [ ] User can search for credit cards by name
- [x] User can tap the search result to see card details
- [x] User is presented with a few of the most popular cards among CardShark users to save a search step
- [x] User can add the card in focus to their wallet
- [ ] Wallet presents current bonus categories and earning rates for each card

### Recommending Cards to Use at Merchants
- [ ] CardShark identifies merchants close to user location and ranks by distance and frequency
- [ ] CardShark matches merchants to wallet card bonus categories
- [ ] CardShark pushes notification to user about top suggested card to use at top guess merchant
- [ ] User can view list of nearby merchants and pick the one they are actually visiting
- [ ] User can search for merchants by name (nearby or online shopping)
- [ ] Nearby merchant listings include category and associated recommended card
- [ ] User can confirm/log the merchant they visited to improve future recommendations

### Suggesting Optimal Card/Wallet mix
- [ ] For wallet minimalists: Identify the best cards to carry this quarter
- [ ] Suggest new cards that offer more rewards for the user's most frequented businesses

### Back End
- [ ] Store user's wallet cards in cloud
- [ ] Cache user's wallet cards in CoreData
- [ ] Connect API for recognizing cards visually
- [ ] Connect API for retrieving card bonus categories
- [ ] Connect API for identifying merchant category
- [ ] Connect to Foursquare API for nearby merchant search

## Video Walkthrough

Here's a walkthrough of implemented user stories:

| [v1](https://github.com/wangela/wittier/tree/v1) walkthrough |  |
|:----:|:----:|
| <img src='anim_wittier_v1.gif' title='Week 1 Walkthrough' width='' alt='Week 1 Walkthrough Video' /> |  |
| v2 walkthrough of new features | v2 walkthrough (Following feature) |
| <img src='anim_wittier_v2.gif' title='Week 2 Walkthrough' width='' alt='Week 2 Walkthrough Video' /> | <img src='anim_wittier_v2following.gif' title='Week 2 Following Walkthrough' width='' alt='Week 2 Following Walkthrough Video' /> |

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
CardShark UX design and graphics provided by [Timothy Wong](http://timothywong.com/)

## License
  MIT License

  Copyright (c) 2018 Angela Yu

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
